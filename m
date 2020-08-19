Return-Path: <jailhouse-dev+bncBCW4LL4WQ4PBBL5Z6P4QKGQEULEJUDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73a.google.com (mail-qk1-x73a.google.com [IPv6:2607:f8b0:4864:20::73a])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEF12497E4
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 10:02:57 +0200 (CEST)
Received: by mail-qk1-x73a.google.com with SMTP id 1sf14944372qki.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 01:02:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597824176; cv=pass;
        d=google.com; s=arc-20160816;
        b=psAq/49tVz2YGERefM5VUxl03eFoWyRlZCnm4YzoLXxiOln1mCi+YHuBkmn4gjo/dS
         OFod59mxb/Ed4138LjHR+LXsFPEGU+BQfHruLheeqqTNnYnkAjvVssAwjz+GPCRhel20
         fLiou3c2gakpOvuwaAAzmxp+SYWlLxlgzBVmYpgU/xa7SeiM4+hIsEuKxaCUEvoPt6aB
         ccajgaMlvGzSGVOiGJHX+cY0w+FgbgsfZRmRqsTCWecy2wwhmwlEJ4SEoAnRHh98nF/l
         WjuFb7YtaIA+SebXDJlbI7DCGekU9E/zMDAVqkGO8W7jKa7KfOFrtFN5Jo/kXweVAIYa
         //Gg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=yxnkA1ZGh8TDkQ8Io8dWzwRKLgMVetVEMM3FSei9SEk=;
        b=asZkiGqd6GjtSzFFbojwiatztXIzg69um7VO7ZTYWaN8XS95/MFRqO5vX3RLgJVga3
         U41Xb1arRQC1WGiSpM6BBoCL/fxwdNVXJGxA4wlRBKAPaR5uYC7fcptPJZy+/kjYcSE9
         j6ghMN2j8tUB8+w0VeLQYj3gw/xIA5Oz5dlEwe8E6eE6s4TKccEgN3KYH1cCc5R0GXSJ
         bm9Fhptff7BVOEYoLveIvk7YzOIJXJy5HqqssMiZB+nX9e6PYhKyXhhCDMI5u8MCR9O/
         AiUJq+FFSpOBapV6wIQYlKN0fnYsskD5TxLvJi/KeLJ3P2H32VSKe7Wn3DkF5enXZ6MY
         /2hg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Npr8hxz6;
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::233 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yxnkA1ZGh8TDkQ8Io8dWzwRKLgMVetVEMM3FSei9SEk=;
        b=gz5kj/WaVkn1Kjot7j/1qbuoeuq/9krx9rsi/7p2KM0fUHSOoD9RqT2L7aoPE3ePij
         9TeJEurfWaK7kCL+gzoFUk+U9jOHePPmRMPbpcGt7L3BRdFSrLJ4r7eZvJ6E17/0742b
         DXJU4ZxBWL4k5SCrZjnux/As4ZvLE2VH0Ot8PFtX+Vxv3yddELVx2xTMknLAzALv2w1Y
         w8tUTT9ovfrhxL6uLHle50pw9XToIcGkhD1ntaLoClPhU/8AAjgsUZvcX4VUA7pkka+i
         2UhRmHsDdtKfUGmJ3V32ee9cYb9zb6uRkeBSvi60YwpRrmbX4n5T/IScDoEmyFsFt9pt
         hNrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yxnkA1ZGh8TDkQ8Io8dWzwRKLgMVetVEMM3FSei9SEk=;
        b=YVuTXqFCpwrYt5HUpHysbTljPLIbT2+Mhkx8cbHdScLpNQ54BbgpAlWapfQZdH00qF
         OV1GSfmKp+wfJQI+4iTQrgdPojszkbBHH0Yc7fUK0fesRFjERrmH6g14gUWtKA51Sb0H
         bE0k8W9QlhlSQhtke8H0sHuncYaJoRnk8EgR1nmM6kDTtlzSXMoTasH7Bc46erJb7Byt
         tTjL6wpyspn7QtbxiKiC76ECEx+sY+4IOiAfh83WpMdFmKGemP7+VcFTxuCnptMw+97b
         W6AQLBoxiaPheeUxldezvJl6HHltP7olPGXXNxXyyK1qG6q1R3jhLU7S+GsA8F4TQVFy
         IU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yxnkA1ZGh8TDkQ8Io8dWzwRKLgMVetVEMM3FSei9SEk=;
        b=GUWOVUBIwmeIRjuxBgNlaZOGtiTUzlQLSthHlZA3K8QrFyM1C/7z6iNyG3CnsL5P6K
         eyJtEJMsm4YvG/pH9Q53fL8HajsYnfLMkui1imvN+LzeWjvWVDCizVZY2gPxPvkGIC9s
         +cn0QVVZW2vV6Kax2KYNJD2AYgyWFHZ1tel8IWpooN9n01Ent3Bi5xcYxNQYYskSMUiw
         0Fc5j2ejEI97+1B9eS8uVMs72nvAw2BBc3Ni989QLZtHWJSWBb7ahTl5o5d3JP5dl4cr
         uM0gfUeAKwWVY2nOD40tNjVBmMJ2Q5s89YdqovOqKU/I7mmzu8SrVcfUMljNXQn8f9gu
         Ip7A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Id7pioMEcji40+rEZMGflHPHfM1HJMtOOIHlN1AV+kjO6Z7aU
	Me1L6LkbPOuwLIQl5mDssz8=
X-Google-Smtp-Source: ABdhPJzs5iFkSvZRe6whF6yqPuz+Eedj40SHRXLqGQhhjzO7TCMicuPsijkQakYtVfDez+8GYVbKgw==
X-Received: by 2002:ac8:6647:: with SMTP id j7mr21064256qtp.335.1597824176249;
        Wed, 19 Aug 2020 01:02:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ad4:5010:: with SMTP id s16ls5730181qvo.9.gmail; Wed, 19 Aug
 2020 01:02:55 -0700 (PDT)
X-Received: by 2002:ad4:414b:: with SMTP id z11mr21803669qvp.116.1597824175648;
        Wed, 19 Aug 2020 01:02:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597824175; cv=none;
        d=google.com; s=arc-20160816;
        b=ayHEkFtWBxzu76B8RVdPJaIU3cQwuF5vbC5h8SNy4CkOdPa0yT/5UdwPeAFSMFk8sy
         Rszx+h4ZNOHswM/or0sP8JSXOBAwZyzqtlxEwRN4yBGkqOd7oFqJgIGHZHUujIjKHAlQ
         OutE/sLlk033CGzf2rfza4AKLFGAQ/qYWcJEK3ZivwgkI3s+CZcU+Tc0hPsTQLQ4vFOT
         RA/UYZ0qFrpiy8OS9U1NXr7n0GspwP0DTtsbPTtqm0n1ewAG5Si1/pO1bSjIAZDwv93J
         QmJZp85Kn29enE+Xt80kslYzUMoZ9+nTBNAnzgnQnc8lxCpqlQYGd7dfenyaRJyAIQTJ
         B3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MlagJKOZ1mFzjVKwgfjHzQivODHNzZEMLT+sEocBIWs=;
        b=gTqdeLdPSEtj3PmdJVrEiEpbrRyU1Qn+v/Q2Uq0NRxKPe7FgbJbU0cvY3rBNkPWSon
         QlFrTnnKMRccv+rJlw6K42viGbyHho17O2FHQMxkJMq8oSayS7HCrcas4ruHjMySe5Hu
         YRJ9AKq4Hm6bHIVmk4JMJq8JDKjzxumL6q2vsefl+hbBLnfgb7QN2aBYOjz4GCItxv7m
         +9COnwZbQ/XoDbRRFEGtsv8W3GCxFcZ8Bf/xlMbxmU0xlnxYF6oimPunVsK7A6tBrEha
         Xi7Q8Z9wbS7SZS6CJ+UdraxAk1U0OvsnhM4TS1Kq6KfHl1HFTTJ7/cNqr/Jav4bqF6yB
         mc3g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Npr8hxz6;
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::233 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com. [2607:f8b0:4864:20::233])
        by gmr-mx.google.com with ESMTPS id y14si1071160qka.6.2020.08.19.01.02.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2020 01:02:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::233 as permitted sender) client-ip=2607:f8b0:4864:20::233;
Received: by mail-oi1-x233.google.com with SMTP id l204so20264864oib.3
        for <jailhouse-dev@googlegroups.com>; Wed, 19 Aug 2020 01:02:55 -0700 (PDT)
X-Received: by 2002:aca:4345:: with SMTP id q66mr2362934oia.151.1597824175168;
 Wed, 19 Aug 2020 01:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <d5e0edf5-118c-4827-b21e-37975bbddffeo@googlegroups.com>
In-Reply-To: <d5e0edf5-118c-4827-b21e-37975bbddffeo@googlegroups.com>
From: Peng Fan <van.freenix@gmail.com>
Date: Wed, 19 Aug 2020 16:02:43 +0800
Message-ID: <CAEfxd-_oGgCuE5CH5OaS4RjtbXKFW2vViOfaYVLeqGcJSAK8Tg@mail.gmail.com>
Subject: Re: imx8: could run linux in non-root cell, how to copy data from
 host system or from root cell to non-root cell.
To: Vipul Suneja <vsuneja63@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="0000000000005fe1fe05ad366e83"
X-Original-Sender: Van.Freenix@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=Npr8hxz6;       spf=pass
 (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::233
 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000005fe1fe05ad366e83
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

After your booted up the 2nd linux, you could setup virtual network using
below steps:
How to setup network for 2nd linux using network



   1. After first linux boots up
      1.

      sysctl -w net.ipv4.ip_forward=3D1
      sysctl -p /etc/sysctl.conf
      2. After root cell enabled
      1. iptables -A FORWARD -i eth1 -j ACCEPT

      iptables -A FORWARD -o eth1 -j ACCEPT
      iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
      3.

   After 2nd linux boots up
   1.

      ifconfig eth1 or 2 192.168.1.4 for the 1st linux


      2.

      ifconfig eth0 192.168.1.5 for the 2nd linux
      3.

      "ip route add default via 192.168.1.4 dev eth0" for the 2nd linux
      "ip route add 10.193.108.0/24 via 192.168.1.4 dev eth0" for 2nd linux
      4. Now you could "mount -t nfs 10.193.108.xx:/home/xxx/nfs /mnt"


Regards,
Peng.

Vipul Suneja <vsuneja63@gmail.com> =E4=BA=8E2020=E5=B9=B48=E6=9C=8812=E6=97=
=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=888:43=E5=86=99=E9=81=93=EF=BC=9A

>
> I could run yocto bsp 5.4.24 image in root cell(SD card) & non root
> cell(emmc). Trying to copy some binary (from host machine)to run on
> non-root cell image but unable to copy via ethernet. I found ivshmem in
> configuration for communication between cells. What are the steps to use =
it
> & to share data between cells.
>
> Thanks
> Vipul
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/d5e0edf5-118c-4827-b21e-3=
7975bbddffeo%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/d5e0edf5-118c-4827-b21e-=
37975bbddffeo%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
> .
>


--

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAEfxd-_oGgCuE5CH5OaS4RjtbXKFW2vViOfaYVLeqGcJSAK8Tg%40mail.gm=
ail.com.

--0000000000005fe1fe05ad366e83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>After your booted up the 2nd linux, you could setup v=
irtual network using below steps:</div><div><span style=3D"color:rgb(23,43,=
77);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Robot=
o,Oxygen,Ubuntu,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetic=
a Neue&quot;,sans-serif;font-size:14px">How to setup network for 2nd linux =
using network</span><p style=3D"margin:10px 0px 0px;padding:0px;color:rgb(2=
3,43,77);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,=
Roboto,Oxygen,Ubuntu,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Hel=
vetica Neue&quot;,sans-serif;font-size:14px"><br></p><ol style=3D"margin:0p=
x;list-style-type:lower-alpha;color:rgb(23,43,77);font-family:-apple-system=
,BlinkMacSystemFont,&quot;Segoe UI&quot;,Roboto,Oxygen,Ubuntu,&quot;Fira Sa=
ns&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif;font-=
size:14px"><li>After first linux boots up<ol style=3D"margin:0px;list-style=
-type:lower-roman"><li><p style=3D"margin:0px;padding:0px">sysctl -w net.ip=
v4.ip_forward=3D1<br>sysctl -p /etc/sysctl.conf</p></li></ol></li><li>After=
 root cell enabled<ol style=3D"margin:0px;list-style-type:lower-roman"><li>=
iptables -A FORWARD -i eth1 -j ACCEPT<p style=3D"margin:0px;padding:0px">ip=
tables -A FORWARD -o eth1 -j ACCEPT<br>iptables -t nat -A POSTROUTING -o et=
h0 -j MASQUERADE</p></li></ol></li><li><p style=3D"margin:0px;padding:0px">=
After 2nd linux boots up</p><ol style=3D"margin:0px;list-style-type:lower-r=
oman"><li><p style=3D"margin:0px;padding:0px">ifconfig eth1 or 2 192.168.1.=
4 for the 1st linux</p><p style=3D"margin:10px 0px 0px;padding:0px"><br></p=
></li><li><p style=3D"margin:0px;padding:0px">ifconfig eth0 192.168.1.5 for=
 the 2nd linux</p></li><li><p style=3D"margin:0px;padding:0px">&quot;ip rou=
te add default via 192.168.1.4 dev eth0&quot; for the 2nd linux<br>&quot;ip=
 route add <a href=3D"http://10.193.108.0/24">10.193.108.0/24</a> via 192.1=
68.1.4 dev eth0&quot; for 2nd linux</p></li><li>Now you could &quot;mount -=
t nfs 10.193.108.xx:/home/xxx/nfs /mnt&quot;</li></ol></li></ol></div><div>=
<br></div><div>Regards,</div><div>Peng.</div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">Vipul Suneja &lt;<a href=3D"mailto:v=
suneja63@gmail.com">vsuneja63@gmail.com</a>&gt; =E4=BA=8E2020=E5=B9=B48=E6=
=9C=8812=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=888:43=E5=86=99=E9=81=
=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div><br></div><div>I could run yocto bsp 5.4.24 image in roo=
t cell(SD card) &amp; non root cell(emmc). Trying to copy some binary (from=
 host machine)to run on non-root cell image but unable to copy via ethernet=
. I found ivshmem in configuration for communication between cells. What ar=
e the steps to use it &amp; to share data between cells.</div><div><br></di=
v><div>Thanks</div><div>Vipul<br></div></div>

<p></p>

-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com" targe=
t=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/d5e0edf5-118c-4827-b21e-37975bbddffeo%40googlegrou=
ps.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank">https:=
//groups.google.com/d/msgid/jailhouse-dev/d5e0edf5-118c-4827-b21e-37975bbdd=
ffeo%40googlegroups.com</a>.<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><br></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAEfxd-_oGgCuE5CH5OaS4RjtbXKFW2vViOfaYVLeqGcJSAK8T=
g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CAEfxd-_oGgCuE5CH5OaS4RjtbXKFW2vViOfaYVLeqG=
cJSAK8Tg%40mail.gmail.com</a>.<br />

--0000000000005fe1fe05ad366e83--
