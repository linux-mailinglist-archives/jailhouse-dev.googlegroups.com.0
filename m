Return-Path: <jailhouse-dev+bncBC653PXTYYERBVVF3SGQMGQE4ZKT67A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id 319E44723D2
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Dec 2021 10:31:04 +0100 (CET)
Received: by mail-qk1-x73b.google.com with SMTP id bj32-20020a05620a192000b0046dcca212b6sf14379426qkb.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Dec 2021 01:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ofFzKhyU865xt7748iM0XopJIVEuwwJQHwP2WtaSsUY=;
        b=SiqHYr8wvDErzxXON4bZka3Qy6JnzpUtzRReK2NElBPBjXH0tHBnRDe+bpkCq88aXA
         M25raybLnctqPamQYhWoZF/hkYuGsCs7QSaQaDOr5H3SgAwNNMmqFLvZgjlNFYf7TGhe
         XVLT+zWb+TUMJrEYdS6FvTXPVdXzwOLF1A2LqzcgZbqRwkjdrW8MkpkVYWqeqwO8QKRg
         vB4/nVbztH1cwanfSp/Xc3JAmQ0O4ajq0Q6ZxZmO5Lxkj7fnzgMar22uVm2KoMracijt
         8XRYxVK1lMBpIUzSggCefmmwaNEg3pMFo4pSb+GjiWzU/2cV+Sl73g6MLYnTchEA/gvD
         A5Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ofFzKhyU865xt7748iM0XopJIVEuwwJQHwP2WtaSsUY=;
        b=GgDjD0VAg+/5sa7P4cBsWRGyuOBb3SUzwFEWPRzBI62UQjE5FuluLiZhJviERWBsRD
         /dR70lomNeWTGbub22MIA3eQR3+zLXY0bNWAOCAnommS5r2UmeulXptFZhrnX+QlhEI9
         /2t9fb6lf4jb57o4GdIKc5vTpqpU8w151ho6DH8k79AKz7g+Z62RCGah/dq+jUdCQfYB
         ERaueVYv+S0Yud00KlB4Z1HS9lESwHmLc9Hj9euBpGLDUYObfrF8+Lnm+T1rkio5YxR6
         fGa3XYDekHLQcoIU1aPXySYXAQbyejeAyUPopMcNKzVb8jOBuzWyGgeTGP+svKhkmIYH
         6+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ofFzKhyU865xt7748iM0XopJIVEuwwJQHwP2WtaSsUY=;
        b=DPAu7ZnzfERcexecROUzTOls1YYcGaGD+ZIEDQqk0pobQOjetVA7fMZW+rvstPNA8y
         Cj4qas2S1sZwFgS8IOCFA+0qGsItwhc7W4jnqTqtZDhy8Rq73AnpL6HGpMQXang0Iwnw
         grGBGX1qUZWFW3h7kETq+ZEB1qZJbwP20KXQUG8an8GzYfbVDUfrVfM6GBhk/vEcTEkv
         ojvxJjpTEXTXRCBprtlcgVaRjldJ58oJKExp1Uhdo5ttWZ2P93yOtQGDV14vwJakjqBq
         zvoEisnxTU/so7bIGHw3JKk7WtkMtkbZNiSGLxHI8OJuq9tgIBJgvDn8j+Ay00riYG/8
         yENQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530+d7TmrGiaYyi0debulvmIueCb54zcBsk7b7Xjn8yDiYlztiBk
	pw5Do3dfSp9dpeWVBPCxhnI=
X-Google-Smtp-Source: ABdhPJxJE9X1mAv0bZz7p1Si5AOt5bDdGt16nirEtR/szrt5J9+KnlcSAs9DwNxClT9FYet1PTuuQw==
X-Received: by 2002:a0c:f750:: with SMTP id e16mr41545955qvo.110.1639387862928;
        Mon, 13 Dec 2021 01:31:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:8984:: with SMTP id l126ls3859767qkd.1.gmail; Mon, 13
 Dec 2021 01:31:02 -0800 (PST)
X-Received: by 2002:a05:620a:2546:: with SMTP id s6mr32288484qko.378.1639387862276;
        Mon, 13 Dec 2021 01:31:02 -0800 (PST)
Date: Mon, 13 Dec 2021 01:31:01 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <022d5f64-8a41-4128-9349-1f2d82b8727an@googlegroups.com>
In-Reply-To: <20210329104747.2f396831@md1za8fc.ad001.siemens.net>
References: <53464ac4.9478.17879314390.Coremail.caohp19@lzu.edu.cn>
 <20210329104747.2f396831@md1za8fc.ad001.siemens.net>
Subject: Re: HELP
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4476_916668032.1639387861664"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_4476_916668032.1639387861664
Content-Type: multipart/alternative; 
	boundary="----=_Part_4477_1366942652.1639387861664"

------=_Part_4477_1366942652.1639387861664
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Mr Henning
>If that PCI device is of type JAILHOUSE_SHMEM_PROTO_VETH=20
>and the cell has a driver ... you will see a new ethernet interface=20
>becoming available.=20
What do you mean by "and the cell has a driver" I ported jailhouse on both=
=20
5.4 and 5.10 kernel using jailhouse patches. And added ivshmem interface=20
but it was not working.=20

Best regards,
Moustafa Noufale
On Monday, 29 March 2021 at 11:02:57 UTC+2 Henning Schild wrote:

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
jailhouse-dev/022d5f64-8a41-4128-9349-1f2d82b8727an%40googlegroups.com.

------=_Part_4477_1366942652.1639387861664
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Mr Henning<br>&gt;If that PCI device is of type JAILHOUSE_SHMEM_PROTO=
_VETH
<br>&gt;and the cell has a driver ... you will see a new ethernet interface
<br>&gt;becoming available.
<br>What do you mean by "and the cell has a driver" I ported jailhouse on b=
oth 5.4 and 5.10 kernel using jailhouse patches. And added ivshmem interfac=
e but it was not working. <br><br>Best regards,<br>Moustafa Noufale<br><div=
 class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Monday, 29=
 March 2021 at 11:02:57 UTC+2 Henning Schild wrote:<br/></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid r=
gb(204, 204, 204); padding-left: 1ex;">Am Sun, 28 Mar 2021 22:16:14 +0800 (=
GMT+08:00)
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
.com/url?hl=3Den-GB&amp;q=3Dhttp://baidu.com&amp;source=3Dgmail&amp;ust=3D1=
639472776728000&amp;usg=3DAFQjCNFAFloh7oESsZ-HM0bn5Ba2-X4nbA">baidu.com</a>=
(in China ) or
<br>&gt; <a href=3D"http://google.com" target=3D"_blank" rel=3D"nofollow" d=
ata-saferedirecturl=3D"https://www.google.com/url?hl=3Den-GB&amp;q=3Dhttp:/=
/google.com&amp;source=3Dgmail&amp;ust=3D1639472776728000&amp;usg=3DAFQjCNH=
VeJrs6zF6vXeGTiza3P21GJHIrQ">google.com</a>.
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
om/d/msgid/jailhouse-dev/022d5f64-8a41-4128-9349-1f2d82b8727an%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/022d5f64-8a41-4128-9349-1f2d82b8727an%40googlegroups.co=
m</a>.<br />

------=_Part_4477_1366942652.1639387861664--

------=_Part_4476_916668032.1639387861664--
