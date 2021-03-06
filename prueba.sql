PGDMP         .                x           prueba    13.0    13.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17405    prueba    DATABASE     b   CREATE DATABASE prueba WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE prueba;
                postgres    false            �            1259    17411 
   categorias    TABLE     �   CREATE TABLE public.categorias (
    id smallint NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(100)
);
    DROP TABLE public.categorias;
       public         heap    postgres    false            �            1259    17406    clientes    TABLE     �   CREATE TABLE public.clientes (
    id integer NOT NULL,
    nombre character varying(80) NOT NULL,
    rut character varying(10),
    direccion character varying(100)
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    17434    factura    TABLE     �   CREATE TABLE public.factura (
    num_fact integer NOT NULL,
    fecha date NOT NULL,
    id_cliente smallint,
    subtotal integer DEFAULT 0,
    precio_total double precision DEFAULT 0
);
    DROP TABLE public.factura;
       public         heap    postgres    false            �            1259    17446    listado_productos    TABLE     �   CREATE TABLE public.listado_productos (
    cod_detalle smallint,
    cantidad smallint NOT NULL,
    id_prod smallint,
    id_fact integer
);
 %   DROP TABLE public.listado_productos;
       public         heap    postgres    false            �            1259    17416 	   productos    TABLE     �   CREATE TABLE public.productos (
    id integer NOT NULL,
    nombre character varying(50),
    descripcion character varying(100),
    valor_unitario integer NOT NULL,
    id_cat smallint
);
    DROP TABLE public.productos;
       public         heap    postgres    false            �          0    17411 
   categorias 
   TABLE DATA           =   COPY public.categorias (id, nombre, descripcion) FROM stdin;
    public          postgres    false    201   <       �          0    17406    clientes 
   TABLE DATA           >   COPY public.clientes (id, nombre, rut, direccion) FROM stdin;
    public          postgres    false    200   �       �          0    17434    factura 
   TABLE DATA           V   COPY public.factura (num_fact, fecha, id_cliente, subtotal, precio_total) FROM stdin;
    public          postgres    false    203   �       �          0    17446    listado_productos 
   TABLE DATA           T   COPY public.listado_productos (cod_detalle, cantidad, id_prod, id_fact) FROM stdin;
    public          postgres    false    204   6       �          0    17416 	   productos 
   TABLE DATA           T   COPY public.productos (id, nombre, descripcion, valor_unitario, id_cat) FROM stdin;
    public          postgres    false    202   �       5           2606    17415    categorias categorias_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categorias DROP CONSTRAINT categorias_pkey;
       public            postgres    false    201            3           2606    17410    clientes clientes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    200            9           2606    17440    factura factura_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (num_fact);
 >   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_pkey;
       public            postgres    false    203            7           2606    17420    productos productos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
       public            postgres    false    202            ;           2606    17441    factura factura_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(id);
 I   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_id_cliente_fkey;
       public          postgres    false    200    2867    203            =           2606    17454 0   listado_productos listado_productos_id_fact_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.listado_productos
    ADD CONSTRAINT listado_productos_id_fact_fkey FOREIGN KEY (id_fact) REFERENCES public.factura(num_fact);
 Z   ALTER TABLE ONLY public.listado_productos DROP CONSTRAINT listado_productos_id_fact_fkey;
       public          postgres    false    204    203    2873            <           2606    17449 0   listado_productos listado_productos_id_prod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.listado_productos
    ADD CONSTRAINT listado_productos_id_prod_fkey FOREIGN KEY (id_prod) REFERENCES public.productos(id);
 Z   ALTER TABLE ONLY public.listado_productos DROP CONSTRAINT listado_productos_id_prod_fkey;
       public          postgres    false    202    204    2871            :           2606    17421    productos productos_id_cat_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_id_cat_fkey FOREIGN KEY (id_cat) REFERENCES public.categorias(id);
 I   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_id_cat_fkey;
       public          postgres    false    2869    202    201            �   w   x�-��	A�7U��CP+���݃��E���؊�ɂ3s,��vE��J_-�6������ܫ_݊����?�\f��jQz�ڂ�6c����Wo9,�����R�v �9F/�      �   �   x�-��N�0 ��W����'Q EBGK�I��u�>mH
�� ��g��ͥ�Ԅ
o`�ާa�� *���Fh�W�mf�&�����ېlL�����W���_�#�]p��u���x۳�5��4D�a"��*�k��3W±$���8�����*�XWa��V�e�pN���^��>ބ�L茱��I)���=      �   �   x�=�ˍ@�3�2��C/鿎��ш�'���<�A ]I4�鬏u�]u0�d�XN�qso�B��J,�b� M�L��[CiQ�T�>��P����D�.Α}�R\��0��Hk���&Mwg����Ǣ��g��b{Yp]�a�zjwZ9?����2�      �   h   x�-���0C�3XL&�ؽ��:�xtx#��Je�0�4|�X�0m��)�4ɇ����=�_�hc�[��"�gOx�t�����{o��[�N�;���o<�����      �     x�mS[n�0��N�(K~ɟr��� �����&i��D�$�"=���$:Y����@�.ggfw����G%=���B})	k���(�����a�=��p��A���[���Bq[��6���W�t�ތ��n4l�).�O�4ϫ7	��ң0J$�&�P�y̑��]��듖�cq2���Ԁ���(�y}*�V�@*n�֯R9i�<'�E��`%��'uI�\�V_)���5Ui[�J%0��S��v��`W�8LR�`X2�_q4��EMBj׌�!��h���zy����N}��6�r�%ro`oq��+�:�������d��]�8N4���J"ִ)�Ӎ���A+��Zb�A����3��f']bq?�����=��)1y�iL���>������@¸U��8SۂZ�&I%����Dv����G�8��0[���O_��q�L����ǣ�E�S�c�Ͳ��[�>Äa������%OǴ� ��E�Ţ̈́�b;E�]�7�4�1�)�U�G�����0!��(��	�I     