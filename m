Return-Path: <jailhouse-dev+bncBDOPFBHAQEBRBCV6XC2QMGQERU6PVDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C7D946995
	for <lists+jailhouse-dev@lfdr.de>; Sat,  3 Aug 2024 14:14:04 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id 3f1490d57ef6-e0bd2d4cea6sf4271729276.3
        for <lists+jailhouse-dev@lfdr.de>; Sat, 03 Aug 2024 05:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1722687243; x=1723292043; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XhymZg2KaS129/094RO9gny0wpzpc6VwyEUjqp29kjE=;
        b=CqOHOWvKpjylXnUI5S4BgHG59izgry4lwMvx7dxye8WfK8Ngpk61FwWTtymN8UyiZ3
         W5xcICOHaR3IA0jezZPPRk9GM5OjWWEDASHayIBkkQivygxRZ3CEI8XybatsZdwrRzx2
         x983Ih61Rq52mFMQVJd2fqnwTN2qqujiWc/+5xfnhvFOexGgL29V+FFSjdwKT2/LtyEK
         jo6ww1Ocwax4VGDtsYJmSs2QTBwAisaB3NVi3ziMt3tZ8Z3oa9s5wiEKN/p8BrjG4wOg
         iHfsMyoJxdnl+M9wkMWwAmsRXuyeUesw1eVh1QJbtfKvaG6NFpaQQ9T13R54//VRFeBc
         1zzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722687243; x=1723292043; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XhymZg2KaS129/094RO9gny0wpzpc6VwyEUjqp29kjE=;
        b=Vt/xdJfUgHXaVrAG7QnNrAv2FncnHt4QICWzLhbk4riV2lmoSq0EwECJRNfTCxy3ql
         iQZzUgiIkh4zXpPE56VFQNxGao16o6YX9XBh0eR0w1lgHOq4NhstMGCWqU+0MQMbYVWp
         QBnqnPyB6hlwDBjVA/dfl8+fv41KpOs/FjCtX4XG1nWhQA10VSz9uCp7YiXiZurFiana
         OoxptT/S5leOQZBmqLVTURU2my/0ip9OtGtlCFfdx2RQoakGE3enDSXRBDYW8wjW6Z45
         dDaFNUMzQpKxFD/ge2lw+YpRIRzFQfx7PAUGmfx9jFVSlZfepROz8lGp3BdarD87xliF
         c14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722687243; x=1723292043;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XhymZg2KaS129/094RO9gny0wpzpc6VwyEUjqp29kjE=;
        b=LnaLgpJo7X8VhmkdvmdHYp++z0j63x9Gn4XngYpxTq91yOPCkWIinQjx4qOVbmLgBK
         gD+fefCi1AAnKPRSbVaqFwykRIhhVhY12Fnf0lzJfHYx+wsU9bCb77OzlyGaBQhJcRX6
         WQ4JAnSpRZfEMCj2UwMzKyOqzyW0dAx8Oz4+V7qhm6pILOy2gIBf24NQZmJnMvivuaoe
         LaLlDbbyFHe2oD/4Zr8CkAqYqKWUsRRuvRIgbmB3CYnOaTZcN3TnVKqftwL4B8LmgiEF
         F9gxWDu3RInaSvql9MipN967RzSFfOsnJvf7iFhJ956glijf4j+6l6zPMWnH2dteAXOb
         W15w==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVT91Jyzy+DdpI/7AC2G5O4oEul5dIEpricPpv7XpszN0xeFCMWPkC+9+ajoKvbFbIeE2jZusdRgwHfopxhmAeWl+zmabKrM5EXTnc=
X-Gm-Message-State: AOJu0YzE0s4++HH9FD2plfdOFyUYd3VBWwp4A9AiyHXcE8nSt8H4QNRP
	L1ECLpShqKvXB1gB4M1RVhnR42MnmaT+w2EaEseUpzyXk3HPIZew
X-Google-Smtp-Source: AGHT+IFxuNb9uuti2ZQ+qVrNXCzatLd+hK9KHiwA0FKMJhKCB6qVjlDLinJbi1p6Kc5WKZHgwsneRg==
X-Received: by 2002:a25:c8c2:0:b0:e0b:4045:ada0 with SMTP id 3f1490d57ef6-e0bde29b343mr6425730276.23.1722687242933;
        Sat, 03 Aug 2024 05:14:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:1003:b0:e0b:e5b2:98ba with SMTP id
 3f1490d57ef6-e0bf49cad5els1003176276.0.-pod-prod-04-us; Sat, 03 Aug 2024
 05:14:02 -0700 (PDT)
X-Received: by 2002:a05:690c:289:b0:62c:ea0b:a447 with SMTP id 00721157ae682-6895f60d9d6mr2504647b3.2.1722687241676;
        Sat, 03 Aug 2024 05:14:01 -0700 (PDT)
Date: Sat, 3 Aug 2024 05:14:01 -0700 (PDT)
From: =?UTF-8?B?6ZmI6IiS5q+F?= <csydlut@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <49d74b80-c38c-4a3e-9bc8-bc4be5883630n@googlegroups.com>
In-Reply-To: <3b2a8c02-2e34-4a60-bb95-72a97aca445fn@googlegroups.com>
References: <3b2a8c02-2e34-4a60-bb95-72a97aca445fn@googlegroups.com>
Subject: Re: AM62, Jailhouse Uboot compile
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_224732_784838908.1722687241044"
X-Original-Sender: csydlut@gmail.com
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

------=_Part_224732_784838908.1722687241044
Content-Type: multipart/alternative; 
	boundary="----=_Part_224733_1845613426.1722687241044"

------=_Part_224733_1845613426.1722687241044
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Used source code :
1. ti-processor-sdk-linux-am62xx-evm-09.02.01.10
2. linux-extras-6.1.83+gitAUTOINC+ffc2ff4d45-ti
3. u-boot-extras-jailhouse-2023.04+gitAUTOINC+68f2264747
4. jailhouse-0.12+gitAUTOINC+603819ef9a
=E5=9C=A82024=E5=B9=B48=E6=9C=883=E6=97=A5=E6=98=9F=E6=9C=9F=E5=85=AD UTC+8=
 20:12:04<=E9=99=88=E8=88=92=E6=AF=85> =E5=86=99=E9=81=93=EF=BC=9A

> Hi,
>
> We now want to port the jailhouse running on custom hardware. But we are=
=20
> not so familiar with this set of software, so we buy the official board=
=20
> first.
> The operation we have done is listed below.
>
> 1. Download the wic.xz image from official website and flash to the SD=20
> card. Make the target board boot from SD card.
>
> The result is perfect. We can boot Linux and create two partitions easily=
.
>
> 2. Download the SDK : ti-processor-sdk-linux-am62xx-evm-09.02.01.10. Buil=
d=20
> up a develop Host via Ubuntu22.04. And then
>       (1)Flash the files(tiboot3.bin , tispl.bin , u-boot.img)  located i=
n=20
> <SDK_Path>/board-support/prebuilt-images/am62xx-evm-jailhouse into the SD=
=20
> Card boot partition.
>
>       (2)Flash the rootfs from=20
> <SDK_Path>/filesystem/am62xx-evm-jailhouse/tisdk-jailhouse-image-am62xx-e=
vm.tar.xz=20
> into the SD Card root partition.
>
> The result is perfect. We can boot Linux and create two partitions easily=
.
>
> =20
>
> Now we want to compile all the mentioned files by ourselves and preparing=
=20
> to port to our own hardwares.
>
> 1. Switch to top level directory of the SDK_Path;
>
> 2. #Host: make jailhouse_clean
>
> 3. #Host: make jailhouse
>
> 4. #Host: make jailhouse_install DESTDIR=3D<root partition of target>
>
> 5. #Host: make linux-extras
>
> 6. #Host: make linux-extras_install DESTDIR=3D<root partition of target>
>
> 7. #Host: make u-boot-extras
>
> 8. #Host: make u-boot-extras_install DESTDIR=3D<boot partition of target>
>
> Now the SD card should hold all files needed to boot Linux & Jailhouse.
> First, we can boot up the Linux successfully. But after we create a=20
> jailhouse cell, the root cell, which is running on CPU0, would crash=20
> immediately.
>
> In order to find out the error, we overwrite tiboot3.bin tispl.bin=20
> u-boot.img by the files from prebuilt-image folder.
>
> After that, Linux & Jailhouse can work smoothly.
>
> =20
>
> Q1 : Whether we had make any misunderstanding about the commands?
>
> Q2 : If we want to port jailhouse to our hardware, where is the start=20
> point? Could you give us some suggestions?
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/49d74b80-c38c-4a3e-9bc8-bc4be5883630n%40googlegroups.com.

------=_Part_224733_1845613426.1722687241044
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Used source code :<div>1.=C2=A0ti-processor-sdk-linux-am62xx-evm-09.02.01.1=
0</div><div>2. linux-extras-6.1.83+gitAUTOINC+ffc2ff4d45-ti</div><div>3.=C2=
=A0u-boot-extras-jailhouse-2023.04+gitAUTOINC+68f2264747</div><div>4. jailh=
ouse-0.12+gitAUTOINC+603819ef9a<br /></div><div class=3D"gmail_quote"><div =
dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82024=E5=B9=B48=E6=9C=883=E6=97=
=A5=E6=98=9F=E6=9C=9F=E5=85=AD UTC+8 20:12:04&lt;=E9=99=88=E8=88=92=E6=AF=
=85> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote class=3D"gmail_quote=
" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); =
padding-left: 1ex;"><p>Hi,</p> <p>We now want to port the jailhouse running=
 on custom hardware. But we are not so familiar with this set of software, =
so we buy the official board first.<br>The operation we have done is listed=
 below.</p> <p>1. Download the wic.xz image from official website and flash=
 to the SD card. Make the target board boot from SD card.</p> <p>The result=
 is perfect. We can boot Linux and create two partitions easily.</p> <p>2. =
Download the SDK : ti-processor-sdk-linux-am62xx-evm-09.02.01.10. Build up =
a develop Host via Ubuntu22.04. And then<br>=C2=A0 =C2=A0 =C2=A0 (1)Flash t=
he files(tiboot3.bin , tispl.bin , u-boot.img)=C2=A0 located in &lt;SDK_Pat=
h&gt;/board-support/prebuilt-images/am62xx-evm-jailhouse into the SD Card b=
oot partition.</p> <p>=C2=A0 =C2=A0 =C2=A0 (2)Flash the rootfs from &lt;SDK=
_Path&gt;/filesystem/am62xx-evm-jailhouse/tisdk-jailhouse-image-am62xx-evm.=
tar.xz into the SD Card root partition.</p> <p>The result is perfect. We ca=
n boot Linux and create two partitions easily.</p> <p>=C2=A0</p> <p>Now we =
want to compile all the mentioned files by ourselves and preparing to port =
to our own hardwares.</p> <p>1. Switch to top level directory of the SDK_Pa=
th;</p> <p>2. #Host: make jailhouse_clean</p> <p>3. #Host: make jailhouse</=
p> <p>4. #Host: make jailhouse_install DESTDIR=3D&lt;root partition of targ=
et&gt;</p> <p>5. #Host: make linux-extras</p> <p>6. #Host: make linux-extra=
s_install DESTDIR=3D&lt;root partition of target&gt;</p> <p>7. #Host: make =
u-boot-extras</p> <p>8. #Host: make u-boot-extras_install DESTDIR=3D&lt;boo=
t partition of target&gt;</p> <p>Now the SD card should hold all files need=
ed to boot Linux &amp; Jailhouse.<br>First, we can boot up the Linux succes=
sfully. But after we create a jailhouse cell, the root cell, which is runni=
ng on CPU0, would crash immediately.</p> <p>In order to find out the error,=
 we overwrite tiboot3.bin tispl.bin u-boot.img by the files from prebuilt-i=
mage folder.</p> <p>After that, Linux &amp; Jailhouse can work smoothly.</p=
> <p>=C2=A0</p> <p>Q1 : Whether we had make any misunderstanding about the =
commands?<br><br>Q2 : If we want to port jailhouse to our hardware, where i=
s the start point? Could you give us some suggestions?</p></blockquote></di=
v>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/49d74b80-c38c-4a3e-9bc8-bc4be5883630n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/49d74b80-c38c-4a3e-9bc8-bc4be5883630n%40googlegroups.co=
m</a>.<br />

------=_Part_224733_1845613426.1722687241044--

------=_Part_224732_784838908.1722687241044--
