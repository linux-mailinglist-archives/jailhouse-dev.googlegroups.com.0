Return-Path: <jailhouse-dev+bncBDK2NDXEWICBBOV4RGUQMGQET5EPSTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x37.google.com (mail-oa1-x37.google.com [IPv6:2001:4860:4864:20::37])
	by mail.lfdr.de (Postfix) with ESMTPS id 594127BCD0C
	for <lists+jailhouse-dev@lfdr.de>; Sun,  8 Oct 2023 09:46:04 +0200 (CEST)
Received: by mail-oa1-x37.google.com with SMTP id 586e51a60fabf-1dce198f501sf5344471fac.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 08 Oct 2023 00:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1696751163; x=1697355963; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q9gJU7/210q//A4lwSsY3EfoceTxzX/QTUSTVzPfAts=;
        b=hIhelOKd04Gd7zIIYqZPxxZwXgddNZt2JiMmxGrAJFIjuN9YKr+kfHDkVh8hp2BFU0
         6SBPbCAeHdeebNwtlpeV+Cn5wJ0cEbMSAOkUE8KGcZGpom8v8/R0AYXwVQxqqDe0BndT
         MJbf6KQ3Em7mC4QXrrG9y0MYY2ckpC+2LQLGuYatKrQz39+vyz1foPBMIFfSAn4nzeum
         77Ob8EpjS1ViyjnAtuWPklTibAcMXew2bpeJMDV2Y9O2MPH/YYz3Z8mOG5b7OzSpTpuJ
         ZXUu+qognPNAl28pUk/Xg2SqzdDjDAZpxOXBqS3b5QA7MZ8YH31EdphDI9v3b3yEbtg9
         7v+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696751163; x=1697355963; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9gJU7/210q//A4lwSsY3EfoceTxzX/QTUSTVzPfAts=;
        b=ZfpGEsvuFp5WnYcOkp1Qz1FNPWF2xuKTJJo1xwvfkjDTX1tbbidwYfZd0BgSNZBC29
         L5e00JEPBoOXQIl1X42RaG1wAblvAJXSk++VCOoUIOFPRxp0zwodOa08uFwxuZhfbhRN
         rc587ft9B3WqT/OKURRd1DoHGUZiCPLeNDWpki5XVH6DpLF8/BuTekRhWvFSP1kkWOD7
         JwGcYTAnimfjbuxVqYHJ3ceftP/Jx4uEI6czdRdWX6Rlj+beB8NsTCZzGSYlEOt59gyi
         2R2XpE04D4oxnHhj8ZfX1iyWr1a2XECeIKU/ICwczfoaMSE8hPwLWEVzkkIIeku8O2TV
         WSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696751163; x=1697355963;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q9gJU7/210q//A4lwSsY3EfoceTxzX/QTUSTVzPfAts=;
        b=Ph/k+TVK4StujZEhF97lbfHWHJFOS0QH1LaHRCOmBT3ApBgcUQOvhjxVrDgIrCH8vu
         6DSyEOHpYD5C8qvZoU94/zcV0shBL1jYytr4dLnGdD6kY0gtdTZHOANBZxKKASE/SKV2
         aflOWPpidm1fK48KFdoKQI19sIU5afgJDxbQNbh6PRaum25WGuw9l5pyiF+4c5/9rk7l
         +XDxbz+ueyfMd8JbTK3sEO/1mYK6l902A7Di6FGaLUIw6qXzd0RHwrB0tsLpNXiaBN2W
         jTNzPG7ZTrfr9I9RX2yBt0PfY6jf8iI9pXq1n2uRhQSJpVLvcAGGlGKNG4zYZUuwmflt
         /sew==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwcmkJtC8oYypRzhcwz2P+MShC/RXt/467R02szqQ7Ae7XtmojS
	hsljIrlsFVPFqwLF88qM/e0=
X-Google-Smtp-Source: AGHT+IFu6PZhmeCtMC5knLUpxC56WZPvEdW2mKsPqcyQJeom6JSo8nVSQA5AWgqaMLfRMsKfqmFOYA==
X-Received: by 2002:a05:6871:7a7:b0:1bb:c50d:7437 with SMTP id o39-20020a05687107a700b001bbc50d7437mr15128807oap.53.1696751162712;
        Sun, 08 Oct 2023 00:46:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:f714:b0:1c3:e0f6:4173 with SMTP id
 ej20-20020a056870f71400b001c3e0f64173ls2278443oab.2.-pod-prod-08-us; Sun, 08
 Oct 2023 00:46:02 -0700 (PDT)
X-Received: by 2002:a05:6808:1885:b0:3ae:24a0:da9e with SMTP id bi5-20020a056808188500b003ae24a0da9emr6851700oib.3.1696751161897;
        Sun, 08 Oct 2023 00:46:01 -0700 (PDT)
Date: Sun, 8 Oct 2023 00:46:01 -0700 (PDT)
From: z ws <wszlight@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f3e147bd-9384-4ba0-b03f-bff46288878cn@googlegroups.com>
In-Reply-To: <9773370c-619a-47c7-a0fb-522217cc6fa9n@googlegroups.com>
References: <9773370c-619a-47c7-a0fb-522217cc6fa9n@googlegroups.com>
Subject: =?UTF-8?Q?Re:_HELP=EF=BC=9Ahaving_trouble_using_virtio_console?=
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_130735_316837716.1696751161095"
X-Original-Sender: wszlight@gmail.com
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

------=_Part_130735_316837716.1696751161095
Content-Type: multipart/alternative; 
	boundary="----=_Part_130736_1692139794.1696751161095"

------=_Part_130736_1692139794.1696751161095
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

non root cell start with console=3Dhvc0

=E5=9C=A82023=E5=B9=B410=E6=9C=888=E6=97=A5=E6=98=9F=E6=9C=9F=E6=97=A5 UTC+=
8 15:25:28<z ws> =E5=86=99=E9=81=93=EF=BC=9A

> Hi=EF=BC=8Call
>
> when i use virtio console, i ran into a problem.
> in root cell : insmod uio_ivshmem.ko
>             echo "110a 4106 110a 4106 ffc003 ffffff" >                   =
=20
>      /sys/bus/pci/drivers/uio_ivshmem/new_id
>             then ./virtio-ivshmem-console /dev/uio0
> then i start non root cell linux=20
> (CONFIG_VIRTIO_CONSOLE=3Dy/CONFIG_VIRTTIO_IVSHMEM=3Dy),but i can not use =
it=20
> like a serial console. The virtio-ivshmem-console print some status,and=
=20
> then there has no input and output.
>
> this is the virtio-ivshmem-console output:
> Starting virtio device
> device_status: 0x0
> device_status: 0x1
> device_status: 0x3
> device_features_sel: 1
> device_features_sel: 0
> driver_features_sel: 1
> driver_features[1]: 0x13
> driver_features_sel: 0
> driver_features[0]: 0x1
> device_status: 0xb
> queue_sel: 0
> queue size: 8
> queue driver vector: 0
> queue desc: 0x200
> queue driver: 0x280
> queue device: 0x2c0
> queue enable: 1
> queue_sel: 1
> queue size: 8
> queue driver vector: 0=20
> queue desc: 0x400
> queue driver: 0x480
> queue device: 0x4c0
> queue enable: 1
> device_status: 0xf
>
> queue driver vector: 0 is different with demo, Where do I start=20
> troubleshooting?
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f3e147bd-9384-4ba0-b03f-bff46288878cn%40googlegroups.com.

------=_Part_130736_1692139794.1696751161095
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

non root cell start with console=3Dhvc0<br /><br /><div class=3D"gmail_quot=
e"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82023=E5=B9=B410=E6=9C=88=
8=E6=97=A5=E6=98=9F=E6=9C=9F=E6=97=A5 UTC+8 15:25:28&lt;z ws> =E5=86=99=E9=
=81=93=EF=BC=9A<br/></div><blockquote class=3D"gmail_quote" style=3D"margin=
: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex=
;">Hi=EF=BC=8Call<br><br>when i use virtio console, i ran into a problem.<b=
r>in root cell : insmod uio_ivshmem.ko<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 echo &quot;110a 4106 110a 4106 ffc003 ffffff&quot; &gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/sys/bus/pci/drivers/uio_ivshmem/new_id<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 then ./virtio-ivshmem-console /dev/uio0<br>then i star=
t non root cell linux (CONFIG_VIRTIO_CONSOLE=3Dy/CONFIG_VIRTTIO_IVSHMEM=3Dy=
),but i can not use it like a serial console. The virtio-ivshmem-console pr=
int some status,and then there has no input and output.<br><br>this is the =
virtio-ivshmem-console output:<br>Starting virtio device<br>device_status: =
0x0<br>device_status: 0x1<br>device_status: 0x3<br>device_features_sel: 1<b=
r>device_features_sel: 0<br>driver_features_sel: 1<br>driver_features[1]: 0=
x13<br>driver_features_sel: 0<br>driver_features[0]: 0x1<br>device_status: =
0xb<br>queue_sel: 0<br>queue size: 8<br>queue driver vector: 0<br>queue des=
c: 0x200<br>queue driver: 0x280<br>queue device: 0x2c0<br>queue enable: 1<b=
r>queue_sel: 1<br>queue size: 8<br>queue driver vector: 0 <br>queue desc: 0=
x400<br>queue driver: 0x480<br>queue device: 0x4c0<br>queue enable: 1<br>de=
vice_status: 0xf<br><br>queue driver vector: 0 is different with demo, Wher=
e do I start troubleshooting?<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f3e147bd-9384-4ba0-b03f-bff46288878cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/f3e147bd-9384-4ba0-b03f-bff46288878cn%40googlegroups.co=
m</a>.<br />

------=_Part_130736_1692139794.1696751161095--

------=_Part_130735_316837716.1696751161095--
