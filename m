Return-Path: <jailhouse-dev+bncBCF23YV2QAERBUHXZOBQMGQEPSCC5OI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x840.google.com (mail-qt1-x840.google.com [IPv6:2607:f8b0:4864:20::840])
	by mail.lfdr.de (Postfix) with ESMTPS id E202435B4AC
	for <lists+jailhouse-dev@lfdr.de>; Sun, 11 Apr 2021 15:38:25 +0200 (CEST)
Received: by mail-qt1-x840.google.com with SMTP id o15sf292385qtq.20
        for <lists+jailhouse-dev@lfdr.de>; Sun, 11 Apr 2021 06:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4Nu7zUutJYBHVTVQWqNtlKrrJPiIAbeaGZ3Ji4v8N0A=;
        b=SeXc2W/F8h6ibL1vcmybsaNSxDkq6L3fq1i7ed2LXKV1lMCJw4KvZu721Q0NYywMUB
         zL72CpZfxL7TWUAI54/fukm1Vx5e8Mg9NuUyF5kT5iipnGwPIZEntLwpW3Kjgqq0QJ/G
         ENXset3Kyx9hw45eWr6YS35L5xpAiIgEO9Bak+O8hmPRgfGcX1xs7eyiheZGKOXpGo9U
         apD/KY32k09ZCTuMfgr8xl9wUB4REg+Qg2suek5stHkCFKCXO/l6GmOCVzBYv5wnBIMw
         8Aj8H4KDmIBgcYAUzFAq4X2sGY8F4v4/uNTQCa76xc9Ziu0mddBh4JZvjJf3DYOpkkdi
         31hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4Nu7zUutJYBHVTVQWqNtlKrrJPiIAbeaGZ3Ji4v8N0A=;
        b=CUWFwXOQVbh2DEki5wjgNecflDJ8QiwKobPua+LlPmytMvNSxEKNzDT/Q0XMUZZImN
         Jcdir23CN6o24JDw5HMXYp8az+N1XLFJL6rrhVIXXk9j4oetPGiP7ijWW/ERiKPrA5pA
         fDHdNJ3rh/SuyuUxwX5TT44FaV41FMAlJrNKC+EF22fuTkYqE2jaJHfsbkTFPHFHZBN2
         CAAfRmnDslGKwSkaWNQDRk03KxYje5MGiPvFW/W6XUO/XMpozjoIlO6NQvtC5Y6bmSzf
         241bi4cG52XwrnzC+4ornJk9v+FVR0n5SQPT7jVtULARDTAaM2oM6vnBqC18G9qF7uQN
         PmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4Nu7zUutJYBHVTVQWqNtlKrrJPiIAbeaGZ3Ji4v8N0A=;
        b=J9KTYnM1jLY0+uH0jvFws/3gVMxJZ22UH/vPxpxFDWLtPNLYH78n2/Lwx7z+9GRU5M
         Pt4RKeStDPeE6yENFMB8UaACw/vQbulV+D1yTAh0xY7bb2R7CVYcWY0LRjtEdw9rSfxs
         YvlW7k0bNBnZ8VXgwIz+4oDJFGvosPa81JijMXq0pPpUtbmfTwyOnzFX0oS9huR26UR/
         z9zqk2jJpRXRsjk40A3i1u+4dd98Gp8J0w4MXNEj3Iz8vlSbMOTnFwfqTHJ+OqsvuvCk
         wmfkZmS1A0y0L6Eg4nb977oBc9YGo+ckn+bQyj6QfLhB2O99axoXhyi69pU0OFEGa6d3
         7/Zg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533p1aLxlODSAnsGtmT7G/MPfHVEjWbqZKBeh+giYUwx9xkc2DWp
	P9rqJNXLotG9wrU4B6EBGBg=
X-Google-Smtp-Source: ABdhPJxL8PNO5MsTnweAPXcR+eunwJgX1N99HuEixFLZyZpa1PekSyssQGQR3ePXGKFzNKplJ9PP3Q==
X-Received: by 2002:ac8:4811:: with SMTP id g17mr21573678qtq.114.1618148304689;
        Sun, 11 Apr 2021 06:38:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:f601:: with SMTP id r1ls3991843qvm.2.gmail; Sun, 11 Apr
 2021 06:38:24 -0700 (PDT)
X-Received: by 2002:a0c:ab13:: with SMTP id h19mr23085551qvb.42.1618148303853;
        Sun, 11 Apr 2021 06:38:23 -0700 (PDT)
Date: Sun, 11 Apr 2021 06:38:23 -0700 (PDT)
From: =?UTF-8?B?5pyx6Iul5Yeh?= <zhuzhuzhuzai@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1202a375-713f-4a7f-ab12-03425fb2ff52n@googlegroups.com>
In-Reply-To: <ed7d5b78-da24-41bb-8d36-605086fb26ben@googlegroups.com>
References: <ed7d5b78-da24-41bb-8d36-605086fb26ben@googlegroups.com>
Subject: Re: run two linux inmates on raspberry 4b
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2644_1921972442.1618148303168"
X-Original-Sender: zhuzhuzhuzai@gmail.com
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

------=_Part_2644_1921972442.1618148303168
Content-Type: multipart/alternative; 
	boundary="----=_Part_2645_1330046780.1618148303169"

------=_Part_2645_1330046780.1618148303169
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


may I ask u how to build jailhouse on raspberry 4b with an ubuntu 20.04 on=
=20
it?
=E5=9C=A82021=E5=B9=B44=E6=9C=889=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC+8=
 =E4=B8=8B=E5=8D=884:46:14<Smith li> =E5=86=99=E9=81=93=EF=BC=9A

> These  file are my configurations to run two linux inmates on raspberry 4=
b.
> Hardware memory is 2G.
>
> How to use?
> put three files into configs/arm64 folder, make , .c will be compiled to=
=20
> .cell
> The OS and jailhouse I used is compiled from  jailhouse-image repository.
>
> after run  "jailhouse enable rpi4-two-ivshmem-net-inmates.cell"  there=20
> will produce two  network device in root cell. one is set ip as=20
> 192.168.19.1 , the other should set by yourself to 192.168.20.1=20
>
> jailhouse cell linux rpi4-linux-demo1.cell \
> /boot/vmlinuz* \
> -d /etc/jailhouse/dts/inmate-rpi4.dtb \
> -i /usr/libexec/jailhouse/demos/rootfs.cpio \
> -c "console=3DttyS0,115200 ip=3D192.168.19.2"
>
> jailhouse cell linux rpi4-linux-demo2.cell \
> /boot/vmlinuz* \
> -d /etc/jailhouse/dts/inmate-rpi4.dtb \
> -i /usr/libexec/jailhouse/demos/rootfs.cpio \
> -c "console=3DttyS0,115200 ip=3D192.168.20.2"
>
> then the two inmate runs.
>
> I take some content from =20
> https://github.com/ekut-es/autojail/blob/master/configs/arm64/rpi4-two-iv=
shmem-net-inmates.c
> But modified some content.
>
> Wish this will help someone need it.
>
> lake of doc make me headche.
>
>
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1202a375-713f-4a7f-ab12-03425fb2ff52n%40googlegroups.com.

------=_Part_2645_1330046780.1618148303169
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br>may I ask u how to build jailhouse on raspberry 4b with an ubuntu 20.04=
 on it?<div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=
=E5=9C=A82021=E5=B9=B44=E6=9C=889=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC+8=
 =E4=B8=8B=E5=8D=884:46:14&lt;Smith li> =E5=86=99=E9=81=93=EF=BC=9A<br/></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-l=
eft: 1px solid rgb(204, 204, 204); padding-left: 1ex;">These=C2=A0 file are=
 my configurations to run two linux inmates on raspberry 4b.<div>Hardware m=
emory is 2G.</div><div><br></div><div>How to use?</div><div>put three files=
 into configs/arm64 folder, make , .c will be compiled to .cell</div><div>T=
he OS and jailhouse I used is compiled from=C2=A0 jailhouse-image repositor=
y.</div><div><br></div><div>after run=C2=A0 &quot;jailhouse enable=C2=A0rpi=
4-two-ivshmem-net-inmates.cell&quot;=C2=A0 there will produce two=C2=A0 net=
work device in root cell. one is set ip as 192.168.19.1 , the other should =
set by yourself to 192.168.20.1=C2=A0</div><div><br></div><div><div>jailhou=
se cell linux rpi4-linux-demo1.cell \</div><div>/boot/vmlinuz* \</div><div>=
-d /etc/jailhouse/dts/inmate-rpi4.dtb \</div><div>-i /usr/libexec/jailhouse=
/demos/rootfs.cpio \</div><div>-c &quot;console=3DttyS0,115200 ip=3D192.168=
.19.2&quot;</div></div><div><br></div><div><div>jailhouse cell linux rpi4-l=
inux-demo2.cell \</div><div>/boot/vmlinuz* \</div><div>-d /etc/jailhouse/dt=
s/inmate-rpi4.dtb \</div><div>-i /usr/libexec/jailhouse/demos/rootfs.cpio \=
</div><div>-c &quot;console=3DttyS0,115200 ip=3D192.168.20.2&quot;</div></d=
iv><div><br></div><div>then the two inmate runs.</div><div><br></div><div>I=
 take some content from=C2=A0=C2=A0<a href=3D"https://github.com/ekut-es/au=
tojail/blob/master/configs/arm64/rpi4-two-ivshmem-net-inmates.c" target=3D"=
_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url=
?hl=3Dzh-CN&amp;q=3Dhttps://github.com/ekut-es/autojail/blob/master/configs=
/arm64/rpi4-two-ivshmem-net-inmates.c&amp;source=3Dgmail&amp;ust=3D16182346=
26888000&amp;usg=3DAFQjCNEk-Pd3ypJKyOr55rVGYMOAHVKV6w">https://github.com/e=
kut-es/autojail/blob/master/configs/arm64/rpi4-two-ivshmem-net-inmates.c</a=
></div><div>But modified some content.</div><div><br></div><div>Wish this w=
ill help someone need it.</div><div><br></div><div>lake of doc make me head=
che.</div><div><br></div><div><br></div><div><br></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/1202a375-713f-4a7f-ab12-03425fb2ff52n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/1202a375-713f-4a7f-ab12-03425fb2ff52n%40googlegroups.co=
m</a>.<br />

------=_Part_2645_1330046780.1618148303169--

------=_Part_2644_1921972442.1618148303168--
