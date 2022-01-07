Return-Path: <jailhouse-dev+bncBC653PXTYYERBHOY4GHAMGQEHCOEBYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3b.google.com (mail-qv1-xf3b.google.com [IPv6:2607:f8b0:4864:20::f3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A631487A7F
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jan 2022 17:36:47 +0100 (CET)
Received: by mail-qv1-xf3b.google.com with SMTP id jr7-20020a0562142a8700b00411a73d8adasf5262237qvb.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jan 2022 08:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7NqSP3hlN8Jze4uYuQ48VAFAu3ZLEKbY5hQ7NoF1Z8I=;
        b=R51tCR0mqUnaYiBHGFMd7b1p88qn6+C+pxnRLfUtLB5/ZBmUQk5G+Az3Eliu8eDmXZ
         80rHORm9iFRD2Qdj50BXcSw4/4SDa8ijwNwYRYi/O+rmSvDvh7GTNO07XfxT1CoOo8Rs
         HKrN+/XHVZErSKxK99HPkuZq+vq56jUq2s+GMAMShtwnBW+MHzu78GUQpNc5+RAv6v9/
         bJmBRC9vh0hBqubUUggPveAEOv0ngdTKoFmisYVsRGmb7RgtF3uOxbv+r86SEayclE7X
         gDS5WFvDeCiob2O5BGmI/4OF/iDUized+IhUpO9/NQzxUTNkoSh31Q51d17DIeTwt2jr
         Sg/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7NqSP3hlN8Jze4uYuQ48VAFAu3ZLEKbY5hQ7NoF1Z8I=;
        b=Autq0695EacUGc1e+bmSAgZTFTi5B1bBAU4/5bkZBcW4j1GOU2CpIE7wC2NVG4SaqW
         8Wla0sMSWciPf0r2EsDc5LoxukIlAdwlpnKVoZg5KwnXzK3QqrVQpT0Gui/InuCXIE96
         2f/Ni4hrPy6PAsIvgNW3UZ8xpbipzQ4G/4wjOwz7bgkQbtAl4XZSo1cFxdbH2liY3MAR
         hSq+iJiiUkkXXJGWIC/3jc/a8AS+Ju3NQjh5xNpjw4uXIzYO9lN8yOEUDCrDS1NHIpry
         p9lMzoMiX0qRApqoWU7o1MSpjN+RR4i6MhKVDmaKRJsztsZks6pBvzDbMEWjvpGRd1zj
         0JzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7NqSP3hlN8Jze4uYuQ48VAFAu3ZLEKbY5hQ7NoF1Z8I=;
        b=oRgdKpQBCfNn1hxiEViWM8/Itezbq1Pu1t6VihcSE1uxbH1kD1Xga7KF6MoZcYyKNm
         YzRQEjUTEuMH99sThZlJFy+a3ACJdAhMMi+F3gROj/PJ7ofJvT1FO1tuAVkokz0/9zVG
         PbjwWYYD8sQrIKMNy1T6ZStbzbhbPKtQ2eFnyB386c4Wsh4C6CuHHcaI/I3iVYAW1Aj1
         tjTjrmlzHXcCWKX8/e9h2UAQo7ZfJzZvUybG0I6Xl+qZqVwSEtLC8GK+oWqS+N5cgZNI
         WN7GIMibwPxou0bznMKxRYfm/Ci2TqAh3uJPLt+ROGg4TgpTrF8UyNJZ69ly4YdqO9gm
         jZuw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5308jMTlw5AwvKkwnznmc+QVBQWFDXls+rXLkMO6jtidU7vO4kQ/
	7/lwohvIHEdbHlXDqDOg0kA=
X-Google-Smtp-Source: ABdhPJy7rx7iTw0bGU+6zTy/13h/yyLO4+iqMr3q9w5pXxE09qhW926zsT6TC2abaC59Gc5O128VyQ==
X-Received: by 2002:a05:6214:21a4:: with SMTP id t4mr8003069qvc.2.1641573405886;
        Fri, 07 Jan 2022 08:36:45 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:ec0d:: with SMTP id h13ls2250888qkg.3.gmail; Fri, 07 Jan
 2022 08:36:45 -0800 (PST)
X-Received: by 2002:a05:620a:2590:: with SMTP id x16mr46163909qko.603.1641573405130;
        Fri, 07 Jan 2022 08:36:45 -0800 (PST)
Date: Fri, 7 Jan 2022 08:36:44 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c96857c7-319e-4397-ab55-6d77737f681fn@googlegroups.com>
In-Reply-To: <087160d4-a13d-4b2f-6aeb-db370227490c@siemens.com>
References: <1564aad3-da0a-49dc-9966-525688ee83f5n@googlegroups.com>
 <087160d4-a13d-4b2f-6aeb-db370227490c@siemens.com>
Subject: Re: Building Non-Root-Linux
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_978_2001379411.1641573404587"
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

------=_Part_978_2001379411.1641573404587
Content-Type: multipart/alternative; 
	boundary="----=_Part_979_1204119694.1641573404587"

------=_Part_979_1204119694.1641573404587
Content-Type: text/plain; charset="UTF-8"


>
> >If that image is so large, why using buildroot? 
> >
> >Did you have a look at 
> >
> https://github.com/siemens/jailhouse-images/blob/master/recipes-core/non-root-initramfs/files/arm64-config 
> >to get smaller images? 
> Interesting! it seems that jailhouse-images has a solution for everything.
> I have a OPCUA binary and I need to add the required packages: 
> python3-cmake-mosquitto to this build, because it would easier for me and I 
> think it is cleaner. What is the process to add such packages? is it the 
> same as buildroot? is there any source that I can read about this.
>
> >This region defines the primary RAM of the inmate: 
>
> >
> https://github.com/siemens/jailhouse/blob/6234762737513985d5de14d860773ca3257f858c/configs/arm64/rpi4-linux-demo.c#L103 
> Understood
>
> >You can use any ramdisk build system that you like. 
>
>
> >Due to size constraints we have with some targets (the Orange Pi Zero 
> >has only 256M, and we start Linux twice on it), even jailhouse-images 
> >uses a buildroot recipe to get a uclibc-based minimal rootfs for the 
> >inmates. If you do not have such size constraints, you could use a 
> >regular minimal Debian rootfs as well, just converting it into cpio 
> >(image class cpiogz-img, 
> >
> https://github.com/ilbers/isar/blob/master/meta/classes/cpiogz-img.bbclass). 
>
>
> Aha I understand your point, this work I will do in the master thesis. But 
> thank you for mentioning this information.

Best regards
Moustafa Noufale 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c96857c7-319e-4397-ab55-6d77737f681fn%40googlegroups.com.

------=_Part_979_1204119694.1641573404587
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1e=
x;">&gt;If that image is so large, why using buildroot?
<br>
&gt;<br>&gt;Did you have a look at
<br>&gt;<a href=3D"https://github.com/siemens/jailhouse-images/blob/master/=
recipes-core/non-root-initramfs/files/arm64-config" target=3D"_blank" rel=
=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den-GB=
&amp;q=3Dhttps://github.com/siemens/jailhouse-images/blob/master/recipes-co=
re/non-root-initramfs/files/arm64-config&amp;source=3Dgmail&amp;ust=3D16416=
59499272000&amp;usg=3DAFQjCNFSAI1K1geRErnQyXWG2xenJh_96A">https://github.co=
m/siemens/jailhouse-images/blob/master/recipes-core/non-root-initramfs/file=
s/arm64-config</a>
<br>&gt;to get smaller images?
<br>
Interesting! it seems that jailhouse-images has a solution for everything.<=
br>I have a OPCUA binary and I need to add the required packages: python3-c=
make-mosquitto to this build, because it would easier for me and I think it=
 is cleaner. What is the process to add such packages? is it the same as bu=
ildroot? is there any source that I can read about this.<br>
<br>&gt;This region defines the primary RAM of the inmate:
<br>
<br>&gt;<a href=3D"https://github.com/siemens/jailhouse/blob/62347627375139=
85d5de14d860773ca3257f858c/configs/arm64/rpi4-linux-demo.c#L103" target=3D"=
_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url=
?hl=3Den-GB&amp;q=3Dhttps://github.com/siemens/jailhouse/blob/6234762737513=
985d5de14d860773ca3257f858c/configs/arm64/rpi4-linux-demo.c%23L103&amp;sour=
ce=3Dgmail&amp;ust=3D1641659499272000&amp;usg=3DAFQjCNFQYXFeEgODBILnkUGjva3=
WhUh0eQ">https://github.com/siemens/jailhouse/blob/6234762737513985d5de14d8=
60773ca3257f858c/configs/arm64/rpi4-linux-demo.c#L103</a>
<br>Understood<br>
<br>&gt;You can use any ramdisk build system that you like.
<br><br>
<br>&gt;Due to size constraints we have with some targets (the Orange Pi Ze=
ro
<br>&gt;has only 256M, and we start Linux twice on it), even jailhouse-imag=
es
<br>&gt;uses a buildroot recipe to get a uclibc-based minimal rootfs for th=
e
<br>&gt;inmates. If you do not have such size constraints, you could use a
<br>&gt;regular minimal Debian rootfs as well, just converting it into cpio
<br>&gt;(image class cpiogz-img,
<br>&gt;<a href=3D"https://github.com/ilbers/isar/blob/master/meta/classes/=
cpiogz-img.bbclass" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den-GB&amp;q=3Dhttps://github.com/ilbers=
/isar/blob/master/meta/classes/cpiogz-img.bbclass&amp;source=3Dgmail&amp;us=
t=3D1641659499272000&amp;usg=3DAFQjCNELc1euCAwWFo_X907yBEZZwj5X1g">https://=
github.com/ilbers/isar/blob/master/meta/classes/cpiogz-img.bbclass</a>).
<br>
<br>Aha I understand your point, this work I will do in the master thesis. =
But thank you for mentioning this information.</blockquote><div>Best regard=
s</div><div>Moustafa Noufale&nbsp;</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c96857c7-319e-4397-ab55-6d77737f681fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c96857c7-319e-4397-ab55-6d77737f681fn%40googlegroups.co=
m</a>.<br />

------=_Part_979_1204119694.1641573404587--

------=_Part_978_2001379411.1641573404587--
