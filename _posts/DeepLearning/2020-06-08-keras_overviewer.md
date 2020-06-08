---
title: keras overviewer 
date: 2020-06-08 16:25:00
categories:
- DeepLearning
---
## 1. BUild Modle

#### 1.1 Sequential model

模型通常是graphy of layers，最通用的是sequential model，即堆叠层模型

```Python
from tensorflow.keras import layers

model = tf.keras.Sequential()
# Adds a densely-connected layer with 64 units to the model:
# 64为隐藏单元个数，relu是激活函数
model.add(layers.Dense(64, activation='relu'))
# Add another:
model.add(layers.Dense(64, activation='relu'))
# Add an output layer with 10 output units:
model.add(layers.Dense(10))
```

#### 1.2 configure  layers

一些通用的构造参数：

- activation：激活函数，可以设置为内建函数或者`callable abject`；默认不设置激活函数
- `kernel_initializer` and `bias_initializer`：初始化层的权值（kernel和bias）。 This parameter is a name or a callable object；默认是the `"Glorot uniform"` initializer, and the bias defaults to zeros.
- `kernel_regularizer` and `bias_regularizer`：对权值正则化，如L1或L2；默认没有

```python
# Create a relu layer:
layers.Dense(64, activation='relu')
# Or:
layers.Dense(64, activation=tf.nn.relu)

# A linear layer with L1 regularization of factor 0.01 applied to the kernel matrix:
layers.Dense(64, kernel_regularizer=tf.keras.regularizers.l1(0.01))

# A linear layer with L2 regularization of factor 0.01 applied to the bias vector:
layers.Dense(64, bias_regularizer=tf.keras.regularizers.l2(0.01))

# A linear layer with a kernel initialized to a random orthogonal matrix:
layers.Dense(64, kernel_initializer='orthogonal')

# A linear layer with a bias vector initialized to 2.0s:
layers.Dense(64, bias_initializer=tf.keras.initializers.Constant(2.0))
```



## 2. 训练和估计

### 2.1 训练

构建好模型后，用`compile`方法调整学习过程；

```python
model = tf.keras.Sequential([
# Adds a densely-connected layer with 64 units to the model:
layers.Dense(64, activation='relu', input_shape=(32,)),
# Add another:
layers.Dense(64, activation='relu'),
# Add an output layer with 10 output units:
layers.Dense(10)])

model.compile(optimizer=tf.keras.optimizers.Adam(0.01),
              loss=tf.keras.losses.CategoricalCrossentropy(from_logits=True),
              metrics=['accuracy'])
```

`compile`有三个重要参数：

- optimizer：Pass it optimizer instances from the [`tf.keras.optimizers`](https://www.tensorflow.org/api_docs/python/tf/keras/optimizers) module, such as [`tf.keras.optimizers.Adam`](https://www.tensorflow.org/api_docs/python/tf/keras/optimizers/Adam) or [`tf.keras.optimizers.SGD`](https://www.tensorflow.org/api_docs/python/tf/keras/optimizers/SGD)；
- loss：优化过程中的最小化函数。通用选项包含均方误差(mse)；`categorical_crossentropy`, and `binary_crossentropy`. Loss functions are specified by name or by passing a callable object from the [`tf.keras.losses`](https://www.tensorflow.org/api_docs/python/tf/keras/losses) module.
- `metrics`: 监视训练过程. These are string names or callables from the [`tf.keras.metrics`](https://www.tensorflow.org/api_docs/python/tf/keras/metrics) module
- Additionally, to make sure the model trains and evaluates eagerly, you can make sure to pass `run_eagerly=True` as a parameter to compile.



## 3. 预测

## 4. 其他复杂模型

#### 4.2 其他模型

除了sequential模型，还有多输出多输出模型，共享层模型，非堆叠模型（residual connections）；



参考：[Keras--overviewer](https://www.tensorflow.org/guide/keras/overview)