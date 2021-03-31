Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRBQ5ER6BQMGQEOW2OWHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CA834F647
	for <lists+jailhouse-dev@lfdr.de>; Wed, 31 Mar 2021 03:37:09 +0200 (CEST)
Received: by mail-qk1-x73b.google.com with SMTP id j14sf399599qka.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Mar 2021 18:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1OTqvY5F9XqLxDSw0kwVrkE0cfQYgMg6I87KUaZGuxU=;
        b=CUf+q3rxj4/GhKKUhrv54UeCQXLrDVkca/NahPgjunziwSZnnLs6lUhlEo+bQze8Kq
         CFz9ZFwI1ALAxX7Gl0CIVBJQHINg+J1kclXZvqHW1p76UGLftUmdWiwIfL9m8TCsEN6N
         SqULe8RUuq4EHGt50d/T6/FuioXTPYC5qdvqq6/+Qw0R2fsSJG+I18ia2UXlYpJ6Opdq
         JNFRAioGYeRdO/yRBr9DOoT5q0u7HDymocmLZL4M5mDwYx9Lc3bgOcDskottWLiAGtKJ
         TSNcRTpBbZkuOKvi5op36eiL4A2P/MeQirCMw/VerVg2ksnvFGBnKhWEdhMSjoX9mYju
         oWdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1OTqvY5F9XqLxDSw0kwVrkE0cfQYgMg6I87KUaZGuxU=;
        b=IFeRd0qIbj1+ryXLdpw9rL0YKP08zKJ0g8NZaQeB5nU3XFEzl3HcoacPJKfyzrLxat
         Gx3Er42XJvjv+Hi0FUr2jjY9fpM+purbd+fONZrnstUWO62+1E6uP1LCTLRplxEg6iSj
         B/IoPPvn+BIoNlkl5lLBm+eadt4G4paAMTkC3UpnXqNduP7++bkk6lAkg4X5uZVvSQEj
         /EPKnRwdLZY+W22nU/tlQHStfwOvySSaP1OXHaK/dPxNrZyJo1gLQMiHXs7wV93/Z8o4
         qqVevi9AH7x/lrfMICW6OQ0OvV8QBKZuz3p0DUXiLjC07vI3rz4d9h0gv88+dqzQDYkK
         qp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1OTqvY5F9XqLxDSw0kwVrkE0cfQYgMg6I87KUaZGuxU=;
        b=eRXPB8X8zhPo8XF6tmJQ4GcoGgwrze5JIWbOniLC7sTaBBA4rQVZDIlwL6Sxu/GrJD
         pMBNabcrtr5gEdPR9o0CMd6APlEa/LlzimmlrjR/wHtgKy8I4NQU5ihFolw7P+FL8Nsf
         DWra9M5SUSF4nij6Si0jY5u6nn/pSIZc87mu2ufYhwysLAQ+EAqADIKMEh39aKacjXQb
         dIebA/O+f3mH4QRFxJS54OWrqlxbPhe6BFgtsPRuyKxMLC2awRDvGMUCUsx8lsyRweej
         lThF0jM01OUjHTGO3GDWkgwollwdWJrf7rsDay0QMASZFabm0T4Ra1BNI5djzvwrdFGK
         mg4A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531nxtIz9Sspnt7KsUsYwzzUcMd6E5TBfZLFA1sihe0pai3tSnfv
	JzeMC/DeHjktIY7/1JQBKK4=
X-Google-Smtp-Source: ABdhPJwyFnDrPAUOAE1KnmKFYj4aa5qPFuPvnVlGKfgcw89HZnIywFoDrHGIP30rkbeMeZsVYcj1fQ==
X-Received: by 2002:a05:6214:523:: with SMTP id x3mr763485qvw.27.1617154628079;
        Tue, 30 Mar 2021 18:37:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:a98:: with SMTP id v24ls468551qkg.6.gmail; Tue, 30
 Mar 2021 18:37:07 -0700 (PDT)
X-Received: by 2002:a37:9c51:: with SMTP id f78mr1088348qke.228.1617154627443;
        Tue, 30 Mar 2021 18:37:07 -0700 (PDT)
Date: Tue, 30 Mar 2021 18:37:06 -0700 (PDT)
From: Smith li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <288eb03e-f986-4890-8ad6-6102aef44904n@googlegroups.com>
In-Reply-To: <20210329104747.2f396831@md1za8fc.ad001.siemens.net>
References: <53464ac4.9478.17879314390.Coremail.caohp19@lzu.edu.cn>
 <20210329104747.2f396831@md1za8fc.ad001.siemens.net>
Subject: Re: HELP
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_6234_1285345584.1617154626876"
X-Original-Sender: v6543210@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_6234_1285345584.1617154626876
Content-Type: multipart/alternative; 
	boundary="----=_Part_6235_114854975.1617154626876"

------=_Part_6235_114854975.1617154626876
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hello Cao.
This how to access baidu.com in inmate
execute it in root cell.

enable forward
echo 1 > /proc/sys/net/ipv4/ip_forward

iptables setup  ,select one of them
/sbin/iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE  =20
/sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
---------------------------------------------------------------------------=
---------------------------------------






=E5=9C=A82021=E5=B9=B43=E6=9C=8829=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 UTC+=
8 =E4=B8=8B=E5=8D=885:02:57<Henning Schild> =E5=86=99=E9=81=93=EF=BC=9A

> Am Sun, 28 Mar 2021 22:16:14 +0800 (GMT+08:00)
> schrieb =E6=9B=B9=E5=AE=8F=E9=B9=8F <cao...@lzu.edu.cn>:
>
> > Dear sir:
> >=20
> > As we all know, the cell could communicate with root cell by ivshmem
> > in Jailhouse. And there is a virtual Network Interface Card(NIC) on
> > non-root cell. When I run Jailhouse on my raspberry Pi 4 model b, I
> > was successful to create a cell and assigned a address to it. The
> > root cell can communicate with non-root cell , I know this is based
> > on ivshmem. But I want to know=20
> >=20
> > 1. Whether the virtual NIC support other protocols.
>
> It is a virtual ethernet connection, on top you can use anything that
> can be done on top of "network". It is probably best to build whatever
> you need on top of Ethernet, maybe nfs, remote desktop ... but if you
> really need a custom protocol at the base you can write your own driver
> and choose another ".shmem_protocol"
> There is ivshmem-demo giving a simple raw usage example of
> JAILHOUSE_SHMEM_PROTO_UNDEFINED.
>
> > 2. What is difference between virtual NIC in non-root cell and NIC in
> > root cell.
>
> There is none. Once running under jailhouse a cell might see the PCI
> device for shared memory communication on the bus (depending on the
> cell config). If that PCI device is of type JAILHOUSE_SHMEM_PROTO_VETH
> and the cell has a driver ... you will see a new ethernet interface
> becoming available.
>
> > 3. Why the virtual NIC cannot ping baidu.com(in China ) or
> > google.com.
>
> You essentially have an isolated network between the two cells. To
> connect the inmate to the internet, the root cell will have to become a
> network router. So you would set up i.e. NAT to connect on layer3
>
> The most simple solution could be to create a network bridge where you
> attach the real physical network interface and later the virtual one.
> (in the root cell)
> After doing that the non-root should be in the same Layer2 network and
> can use DHCP to get a network configuration that will allow internet
> access just like the root-cell has.
>
> All that is basic networking and has nothing to do with jailhouse.
>
> regards,
> Henning
>
> > If I get your help, I will appreciate =EF=BC=81
> >=20
> >=20
> > Yours sincerely,
> > HOngpeng Cao.
> >=20
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/288eb03e-f986-4890-8ad6-6102aef44904n%40googlegroups.com.

------=_Part_6235_114854975.1617154626876
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hello Cao.<div>This how to access baidu.com in inmate</div><div>execute it =
in root cell.</div><div><br></div><div><div>enable forward</div><div>echo 1=
 &gt; /proc/sys/net/ipv4/ip_forward</div><div><br></div><div>iptables setup=
&nbsp; ,select one of them</div><div>/sbin/iptables -t nat -A POSTROUTING -=
o wlan0 -j MASQUERADE&nbsp; &nbsp;</div><div>/sbin/iptables -t nat -A POSTR=
OUTING -o eth0  -j MASQUERADE</div></div><div>-----------------------------=
---------------------------------------------------------------------------=
----------</div><div><br></div><div><br></div><div><br></div><div><br></div=
><div><br><br></div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"g=
mail_attr">=E5=9C=A82021=E5=B9=B43=E6=9C=8829=E6=97=A5=E6=98=9F=E6=9C=9F=E4=
=B8=80 UTC+8 =E4=B8=8B=E5=8D=885:02:57&lt;Henning Schild> =E5=86=99=E9=81=
=93=EF=BC=9A<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0=
 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">=
Am Sun, 28 Mar 2021 22:16:14 +0800 (GMT+08:00)
<br>schrieb =E6=9B=B9=E5=AE=8F=E9=B9=8F &lt;<a href data-email-masked rel=
=3D"nofollow">cao...@lzu.edu.cn</a>&gt;:
<br>
<br>&gt; Dear sir:
<br>&gt;=20
<br>&gt; As we all know, the cell could communicate with root cell by ivshm=
em
<br>&gt; in Jailhouse. And there is a virtual Network Interface Card(NIC) o=
n
<br>&gt; non-root cell. When I run Jailhouse on my raspberry Pi 4 model b, =
I
<br>&gt; was successful to create a cell and assigned a address to it. The
<br>&gt; root cell can communicate with non-root cell , I know this is base=
d
<br>&gt; on ivshmem. But I want to know=20
<br>&gt;=20
<br>&gt; 1. Whether the virtual NIC support other protocols.
<br>
<br>It is a virtual ethernet connection, on top you can use anything that
<br>can be done on top of &quot;network&quot;. It is probably best to build=
 whatever
<br>you need on top of Ethernet, maybe nfs, remote desktop ... but if you
<br>really need a custom protocol at the base you can write your own driver
<br>and choose another &quot;.shmem_protocol&quot;
<br>There is ivshmem-demo giving a simple raw usage example of
<br>JAILHOUSE_SHMEM_PROTO_UNDEFINED.
<br>
<br>&gt; 2. What is difference between virtual NIC in non-root cell and NIC=
 in
<br>&gt; root cell.
<br>
<br>There is none. Once running under jailhouse a cell might see the PCI
<br>device for shared memory communication on the bus (depending on the
<br>cell config). If that PCI device is of type JAILHOUSE_SHMEM_PROTO_VETH
<br>and the cell has a driver ... you will see a new ethernet interface
<br>becoming available.
<br>
<br>&gt; 3. Why the virtual NIC cannot ping <a href=3D"http://baidu.com" ta=
rget=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google=
.com/url?hl=3Dzh-CN&amp;q=3Dhttp://baidu.com&amp;source=3Dgmail&amp;ust=3D1=
617240701220000&amp;usg=3DAFQjCNE6pz6TyNrREkoUwt3woRUVDEVqGw">baidu.com</a>=
(in China ) or
<br>&gt; <a href=3D"http://google.com" target=3D"_blank" rel=3D"nofollow" d=
ata-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttp:/=
/google.com&amp;source=3Dgmail&amp;ust=3D1617240701221000&amp;usg=3DAFQjCNG=
I7uAEAtCgSgQ92LzMzldkBO9CeA">google.com</a>.
<br>
<br>You essentially have an isolated network between the two cells. To
<br>connect the inmate to the internet, the root cell will have to become a
<br>network router. So you would set up i.e. NAT to connect on layer3
<br>
<br>The most simple solution could be to create a network bridge where you
<br>attach the real physical network interface and later the virtual one.
<br>(in the root cell)
<br>After doing that the non-root should be in the same Layer2 network and
<br>can use DHCP to get a network configuration that will allow internet
<br>access just like the root-cell has.
<br>
<br>All that is basic networking and has nothing to do with jailhouse.
<br>
<br>regards,
<br>Henning
<br>
<br>&gt; If I get your help, I will appreciate =EF=BC=81
<br>&gt;=20
<br>&gt;=20
<br>&gt; Yours sincerely,
<br>&gt; HOngpeng Cao.
<br>&gt;=20
<br>
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/288eb03e-f986-4890-8ad6-6102aef44904n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/288eb03e-f986-4890-8ad6-6102aef44904n%40googlegroups.co=
m</a>.<br />

------=_Part_6235_114854975.1617154626876--

------=_Part_6234_1285345584.1617154626876--
