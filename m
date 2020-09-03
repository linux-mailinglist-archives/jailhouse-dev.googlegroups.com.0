Return-Path: <jailhouse-dev+bncBCZKRDGF7APRB573YT5AKGQEJ3NHSNA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43f.google.com (mail-pf1-x43f.google.com [IPv6:2607:f8b0:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E4825C90D
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Sep 2020 21:03:22 +0200 (CEST)
Received: by mail-pf1-x43f.google.com with SMTP id o184sf2543954pfb.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Sep 2020 12:03:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599159801; cv=pass;
        d=google.com; s=arc-20160816;
        b=dnGwNcB4VtWCk1fquAybCPOcudpqFdYsnJslVQgM8CNAWYT93COZ72dLJW6Yp0xBIY
         JVEYcsgkXyEQNDN8YKNwTtvIOla7wFQPjIpG1+RaWZarmxE7z5y9WVos2p1F4ml9mie3
         69m2TqmFt2tmk9psCMq38NkSfJllSPx08McJ7ec5CTSYu5bY1MEntw6QHIZpVbzBYllE
         pFtr19NSEv8ZPvRHTUjBzIu0oj8D4ZAlPohm3b4aZ/1pH8Pdze6dkGBVdQbzHuQ8QzLq
         7CDS2GpIgT+M29P4oIKxAK8iQUCkWtWsGuaA6APp3af2DdhpcxXZC1wPrt7vrZNPLGYp
         YXdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=eodkZFrYVzKJ4HUtyRV+QHH0i5bKoVFIsG3MniEvcgM=;
        b=NKs5X3MHMArC0B0x1AlAVziTGdVrXRzzEWHUpfk4N+mgz6VoAY6tnkgZsVjDDwbKX3
         SBirSZ+DZRlQE3oZvcgemFDxZHxY9kJGfWSTM1Mw6lRP+2gM8oAz7VJpwPDH2Xl8BxBZ
         N14eFf8GjK/DHeAJaTT/CKIQ/5pGbqqcUp/9Kv6WVBm7Pdrqwqu5W3iqmgNyaXb3HiSa
         7OGBbVnSOvvyatOy8RXHPVxdkXyHTXBugDUNcddokLLbypyighaZ74JI8YYVewfdr+c9
         aCPtLyyKVr3IKrfUguI25My/Mn180qsDXdNevF+et7aqj/E+yWjkwmVz+WkCrqr07AUj
         JNJw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=xW9RD3yj;
       spf=neutral (google.com: 2607:f8b0:4864:20::244 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eodkZFrYVzKJ4HUtyRV+QHH0i5bKoVFIsG3MniEvcgM=;
        b=LrOAPtyXVDxjA31GMuphvWoNZUnbq895Xw7d/VpnALyPN3/Swt7qqz5wlgxvEQ4e5M
         BnF7z1DlBbuWjntWQQVl6EHTOb+3+1WUJT9FGpOtrrq31P7OWwJkKIfIGqQIcm1r/7lv
         TsFC5TXPLLCVDGLTmvVXSdWROH638RNArEpM8mWuVM0Duu3ZyTX69FSOYhxEMyzhGVXv
         WFs8VHjyXz1Enxhyf0Kq2qILhHar8PX61u8trRN+E9PjUENFZ/w5FmXzM8FZ8f0YcvQA
         OWSr7V6FfVPLm+wlN5uz0gahcOw8Rq0+fBOSyQp7rhhVWBfiPapeX443aRe2xkV17iwD
         Yx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eodkZFrYVzKJ4HUtyRV+QHH0i5bKoVFIsG3MniEvcgM=;
        b=DjVkZpTrpJ8qAS3EmCSuITqbTRwvETWGAmdY7cc2RaEav6LXzkB6fE6R7qhISgMdiW
         w10PE7JBTX5eqeBfrub4OgAjNPSHV32iUi6uVtC++bYbtBTeF/ZcKc8+MNt4aKv10nn7
         C6uQRKZa5495EJNXgawIQb6nquxv1vsfM1BlwIa1qhi+pa85Yq9sN0B3BO8TF5EXdT+O
         1A6bZ6STAKBnqx7zPhMd0MGHBNjmoIHcv5/SY1f23AyogAe99dc88cifoDB/BjoxgviW
         VT2gq0YP1uvS733ursiuUmuAqD3r0wCeHI4fkrEmmr/szejT58YKD+Iig2FX0xTp8djq
         BbGA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530IhY4vDLS+BmW5p9bThJvjoIsDaxLqhboaTgssRAGsXCZGiBo/
	ZfXcXJllSL7acwKwE8Ed1Kc=
X-Google-Smtp-Source: ABdhPJxnwU/vNoTUQMqLWYpZLscb4F2ho/arGTG1eWSf236B5jCkqWpVJ4kR7LCFsezWnXoEfH7nEw==
X-Received: by 2002:aa7:864c:0:b029:13c:1611:6591 with SMTP id a12-20020aa7864c0000b029013c16116591mr3381824pfo.14.1599159801158;
        Thu, 03 Sep 2020 12:03:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:142:: with SMTP id 60ls3401829plb.9.gmail; Thu, 03
 Sep 2020 12:03:19 -0700 (PDT)
X-Received: by 2002:a17:90a:9292:: with SMTP id n18mr4743089pjo.159.1599159799047;
        Thu, 03 Sep 2020 12:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599159799; cv=none;
        d=google.com; s=arc-20160816;
        b=Le+oog/1WNP1ebJPBwhY5tuEfiK4xM2NqFdynZWmeDeIWr7PlYhaHuvUZGvuYLrcnO
         prHaeirX13mjb9gI5LXIiwGgYTBSfQMwTPncV4Fhs2jJa4Nku0Wk1qkPze1et0sxOH0J
         jSRI8MWB6VRPj7jNfi7CqqiKBVKLAnVA1BwPs3vhS2MxAqZVmY5DikydrwZJjuEJxkI3
         2P5oAz8fXeOVPkWDPmyRu7w/o6a9s8v1hxk07Q1ayshgVdJbMiON2keKhaBwiVZEJOjV
         c7vkTHiua9zA2q5jHxXpYZAcJ0yBXyB04QFe3eC+97ilHK8hK3qObMRNNrF3kDckRJ00
         qJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5lLwTeS2BgOqpR4qjclAZniRZFJouxSjl8p1+akdP2w=;
        b=wYv4EGU0n4Y4hQ7lARvTN2hCUOE2J6yQ+gRO+zIS9DhE2Yi9FefrXf2uOJxtytD8Ie
         RhJQv++9619B9j3jsQYQkUnp44vz4UmPrEIkycS52P9+6jjUgFDtR6rHtlUNK3vHKtOY
         0cLVGwP5OlPgDxuri60aLga/O1gMQ76JeiU58ix6phRLOsypc8wi1Eyv+xTMwhMFTpMm
         g8cjKXc+RUIFYNJ8xhbXk2VGu1GUc1r+MZ6kRizTTH6qWGNjFx81GFLdW0OOkBZwQZeU
         P3rfPYBgLDALJ0FTSKQlOyswR67klda1lq1C8Xa0HornK1U6Osjqdt6U22vOhPmSjaaF
         eHhQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=xW9RD3yj;
       spf=neutral (google.com: 2607:f8b0:4864:20::244 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com. [2607:f8b0:4864:20::244])
        by gmr-mx.google.com with ESMTPS id a199si307156pfd.1.2020.09.03.12.03.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 12:03:18 -0700 (PDT)
Received-SPF: neutral (google.com: 2607:f8b0:4864:20::244 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) client-ip=2607:f8b0:4864:20::244;
Received: by mail-oi1-x244.google.com with SMTP id x19so4200909oix.3
        for <jailhouse-dev@googlegroups.com>; Thu, 03 Sep 2020 12:03:18 -0700 (PDT)
X-Received: by 2002:aca:db42:: with SMTP id s63mr2892719oig.4.1599159797762;
 Thu, 03 Sep 2020 12:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <db026424-191f-5fe7-1cd0-d2777e4bbd4c@siemens.com>
In-Reply-To: <db026424-191f-5fe7-1cd0-d2777e4bbd4c@siemens.com>
From: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>
Date: Thu, 3 Sep 2020 21:03:06 +0200
Message-ID: <CAGdCPwsT+DGtNmS=AvXiRpv2APTLpz=g3MO8meyS-CL9P2BKxw@mail.gmail.com>
Subject: Re: [PATCH] rpi4: Pick up dtbs from self-built kernel
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000af606905ae6d6790"
X-Original-Sender: jakub@luzny.cz
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623
 header.b=xW9RD3yj;       spf=neutral (google.com: 2607:f8b0:4864:20::244 is
 neither permitted nor denied by best guess record for domain of
 jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
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

--000000000000af606905ae6d6790
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nice, that's the way I wanted to do it, but haven't found room to dive into
Isar.

I've just verified this on 2G, 4G & 8G. Boots and runs a Linux cell as
before.

Jakub

On Tue, 1 Sep 2020 at 12:04, Jan Kiszka <jan.kiszka@siemens.com> wrote:

> From: Jan Kiszka <jan.kiszka@siemens.com>
>
> This should avoid firmware updates when the only difference is a new dtb
> or overlay with some adjusted or new bindings. Apparently, the same
> pattern is used also by meta-raspberrypi on the OE side.
>
> Suggested-by: Jakub Lu=C5=BEn=C3=BD <jakub@luzny.cz>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>
> This depends on v2 of "Updates, support for all RPi4 variants".
>
>  conf/machine/rpi4.conf                          |  3 ++-
>  .../files/debian/rpi-firmware.install           | 17 +++++++++--------
>  2 files changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/conf/machine/rpi4.conf b/conf/machine/rpi4.conf
> index a683b7a..8ccef6b 100644
> --- a/conf/machine/rpi4.conf
> +++ b/conf/machine/rpi4.conf
> @@ -23,8 +23,9 @@ IMAGE_BOOT_FILES =3D " \
>      /usr/lib/rpi-firmware/fixup4x.dat;fixup4x.dat \
>      /usr/lib/rpi-firmware/start4.elf;start4.elf \
>      /usr/lib/rpi-firmware/start4x.elf;start4x.elf \
> -    /usr/lib/rpi-firmware/bcm2711-rpi-4-b.dtb;bcm2711-rpi-4-b.dtb \
>      /usr/lib/rpi-firmware/overlays/*;overlays/ \
> +    /usr/lib/linux-image-*/broadcom/bcm2711-rpi-4-b.dtb \
> +    /usr/lib/linux-image-*/overlays/*;overlays/ \
>      /usr/lib/arm-trusted-firmware/rpi4/bl31.bin;bl31.bin \
>      /vmlinuz;kernel8.img \
>      "
> diff --git a/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
> b/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
> index 701a984..dba3266 100644
> --- a/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
> +++ b/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
> @@ -1,8 +1,9 @@
> -boot/bootcode.bin      usr/lib/rpi-firmware/
> -boot/LICENCE.broadcom  usr/lib/rpi-firmware/
> -boot/*.dat             usr/lib/rpi-firmware/
> -boot/*.dtb             usr/lib/rpi-firmware/
> -boot/*.elf             usr/lib/rpi-firmware/
> -boot/overlays/*                usr/lib/rpi-firmware/overlays/
> -debian/cmdline.txt     usr/lib/rpi-firmware/
> -debian/config.txt      usr/lib/rpi-firmware/
> +boot/bootcode.bin              usr/lib/rpi-firmware/
> +boot/LICENCE.broadcom          usr/lib/rpi-firmware/
> +boot/*.dat                     usr/lib/rpi-firmware/
> +boot/*.dtb                     usr/lib/rpi-firmware/
> +boot/*.elf                     usr/lib/rpi-firmware/
> +boot/overlays/README           usr/lib/rpi-firmware/overlays/
> +boot/overlays/jailhouse.dtbo   usr/lib/rpi-firmware/overlays/
> +debian/cmdline.txt             usr/lib/rpi-firmware/
> +debian/config.txt              usr/lib/rpi-firmware/
> --
> 2.26.2
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAGdCPwsT%2BDGtNmS%3DAvXiRpv2APTLpz%3Dg3MO8meyS-CL9P2BKxw%40m=
ail.gmail.com.

--000000000000af606905ae6d6790
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Nice, that&#39;s the way I wanted to do i=
t, but haven&#39;t found room to dive into Isar.<br><br>I&#39;ve just verif=
ied this on 2G, 4G &amp; 8G. Boots and runs a Linux cell as before.<br><br>=
Jakub</div><div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, 1 Sep 2020 at 12:04, Jan Kiszka &lt;<a href=
=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
From: Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_b=
lank">jan.kiszka@siemens.com</a>&gt;<br>
<br>
This should avoid firmware updates when the only difference is a new dtb<br=
>
or overlay with some adjusted or new bindings. Apparently, the same<br>
pattern is used also by meta-raspberrypi on the OE side.<br>
<br>
Suggested-by: Jakub Lu=C5=BEn=C3=BD &lt;<a href=3D"mailto:jakub@luzny.cz" t=
arget=3D"_blank">jakub@luzny.cz</a>&gt;<br>
Signed-off-by: Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@siemens.com" tar=
get=3D"_blank">jan.kiszka@siemens.com</a>&gt;<br>
---<br>
<br>
This depends on v2 of &quot;Updates, support for all RPi4 variants&quot;.<b=
r>
<br>
=C2=A0conf/machine/rpi4.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0.../files/debian/rpi-firmware.install=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 17 +++++++++--------<br>
=C2=A02 files changed, 11 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/conf/machine/rpi4.conf b/conf/machine/rpi4.conf<br>
index a683b7a..8ccef6b 100644<br>
--- a/conf/machine/rpi4.conf<br>
+++ b/conf/machine/rpi4.conf<br>
@@ -23,8 +23,9 @@ IMAGE_BOOT_FILES =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0/usr/lib/rpi-firmware/fixup4x.dat;fixup4x.dat \<br>
=C2=A0 =C2=A0 =C2=A0/usr/lib/rpi-firmware/start4.elf;start4.elf \<br>
=C2=A0 =C2=A0 =C2=A0/usr/lib/rpi-firmware/start4x.elf;start4x.elf \<br>
-=C2=A0 =C2=A0 /usr/lib/rpi-firmware/bcm2711-rpi-4-b.dtb;bcm2711-rpi-4-b.dt=
b \<br>
=C2=A0 =C2=A0 =C2=A0/usr/lib/rpi-firmware/overlays/*;overlays/ \<br>
+=C2=A0 =C2=A0 /usr/lib/linux-image-*/broadcom/bcm2711-rpi-4-b.dtb \<br>
+=C2=A0 =C2=A0 /usr/lib/linux-image-*/overlays/*;overlays/ \<br>
=C2=A0 =C2=A0 =C2=A0/usr/lib/arm-trusted-firmware/rpi4/bl31.bin;bl31.bin \<=
br>
=C2=A0 =C2=A0 =C2=A0/vmlinuz;kernel8.img \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
diff --git a/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install b/r=
ecipes-bsp/rpi-firmware/files/debian/rpi-firmware.install<br>
index 701a984..dba3266 100644<br>
--- a/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install<br>
+++ b/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install<br>
@@ -1,8 +1,9 @@<br>
-boot/bootcode.bin=C2=A0 =C2=A0 =C2=A0 usr/lib/rpi-firmware/<br>
-boot/LICENCE.broadcom=C2=A0 usr/lib/rpi-firmware/<br>
-boot/*.dat=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usr/lib/rpi-firm=
ware/<br>
-boot/*.dtb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usr/lib/rpi-firm=
ware/<br>
-boot/*.elf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usr/lib/rpi-firm=
ware/<br>
-boot/overlays/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usr=
/lib/rpi-firmware/overlays/<br>
-debian/cmdline.txt=C2=A0 =C2=A0 =C2=A0usr/lib/rpi-firmware/<br>
-debian/config.txt=C2=A0 =C2=A0 =C2=A0 usr/lib/rpi-firmware/<br>
+boot/bootcode.bin=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usr/lib/=
rpi-firmware/<br>
+boot/LICENCE.broadcom=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usr/lib/rpi-firmwa=
re/<br>
+boot/*.dat=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0usr/lib/rpi-firmware/<br>
+boot/*.dtb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0usr/lib/rpi-firmware/<br>
+boot/*.elf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0usr/lib/rpi-firmware/<br>
+boot/overlays/README=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usr/lib/rpi-f=
irmware/overlays/<br>
+boot/overlays/jailhouse.dtbo=C2=A0 =C2=A0usr/lib/rpi-firmware/overlays/<br=
>
+debian/cmdline.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usr/lib/=
rpi-firmware/<br>
+debian/config.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usr/lib/=
rpi-firmware/<br>
-- <br>
2.26.2<br>
</blockquote></div><div><br></div></div>
</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAGdCPwsT%2BDGtNmS%3DAvXiRpv2APTLpz%3Dg3MO8meyS-CL=
9P2BKxw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CAGdCPwsT%2BDGtNmS%3DAvXiRpv2APTLpz%3=
Dg3MO8meyS-CL9P2BKxw%40mail.gmail.com</a>.<br />

--000000000000af606905ae6d6790--
