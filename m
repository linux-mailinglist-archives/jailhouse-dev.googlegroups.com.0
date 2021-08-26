Return-Path: <jailhouse-dev+bncBC653PXTYYERB7XBT6EQMGQE7LKSELQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73a.google.com (mail-qk1-x73a.google.com [IPv6:2607:f8b0:4864:20::73a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8195D3F8F3C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 26 Aug 2021 21:52:31 +0200 (CEST)
Received: by mail-qk1-x73a.google.com with SMTP id q13-20020a05620a038d00b003d38f784161sf637829qkm.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 26 Aug 2021 12:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MwWgLr/7Yhkh3tK+VWZzezYIUQjKFzgRJvu+s/h4kms=;
        b=PrizIcZcCSlTOHHLXl1Mu4SuwX5GOZtvKNVyAt/PI63/36Ee4adWFB4SosPJZ42uL4
         QIRFaUHO+XfNNtop5d9sAPYYh6EAHq+rgf089jSLwFssNMz83qO02cw3qwS9Q+Qr4IbT
         3y6163wY0OXFM2vyrBnzcYnLYDCmklnN6tl+D4xzFP6PBCsiPOStgZeUq7m+R537OZGT
         Mmu9Kmafem/whbDg9f8p+cA9emzryGdtec3nW9a17YHBgdTVNjdHULs2O6hru1snQrPo
         5oT2oyLqRt5RYRtF4FGy/uaqB0Fjlycl2pJTExvLtQ39lLARFY4pTxWCSRk4frs9G8vd
         2qzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MwWgLr/7Yhkh3tK+VWZzezYIUQjKFzgRJvu+s/h4kms=;
        b=KVmLXufL0fpjjj/6kZKep9nSQLHMeCfKbkDbSwVFCsNdOUq6w7IPb+b7zMQVzuJwKK
         COOGL6smJeQ70IVYKD36AXckRbgZ4DFzCpz99Fn/Le0m80WVsec1JcrV72bqbeZNJmyp
         vVUbevfgtRX7V6CnBooq1F3v1G27aH+ndGD4caxCKulsz+DPhSs1iLa9GLdlmdTGE0XN
         JaU603ihI935OCdWdXpI17eU5brNuxWMM3/ZkCzaHaoFQj3Vepto2m4P5k4WQB6oglgp
         +x/DHVA3SGxmUgKyX3/MsT6aqHiMVN0lp8ZOsoCgCP/cmYD8LTt3kHKJsFlLEhOhNgiN
         8XKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MwWgLr/7Yhkh3tK+VWZzezYIUQjKFzgRJvu+s/h4kms=;
        b=cdP3LVARNuwpB9QhcUVdTLRSaajjVfiFJCE+6i/yiOcj4bzVTJCEkrPW/6Q3A5Lvc2
         U7m61TkIdjbCuJtjNkK54pIXA9wWt8xa64fa+kwNQDu+wP4AE+fsDRp4h78nD6HjMDuu
         352gdETZRcdDCqhHicjoUk5hIVUNG45jZae+UHFfSqxtOXLh7EXbdYRmhWU/kgSqo1f/
         WAf6N0S8Uv5MRFMjdM8A8LzgBLnc0QId7U8aYfV9uXrURikBQFUsNQWgmqs4f8FLwnWY
         m10wJ/L3bWDh+W58OTNCNEtzWGAzGw2XdF8sJ4X7IS2nto7f1FBOkijkoz+d6jJlImES
         u4tw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530tHLnCmiOhb1/deKA9/ilXpnx3AT4zEfOAwrTtjFSjlCui6E1x
	dX3//8+p2CMhha1ttjB4TEw=
X-Google-Smtp-Source: ABdhPJyDASAxzajmrKq8+GQCm8V4MH2n6C8HmRX+7QL4CFgRCDs/noSMeyS2qUdOEcjY9VZ4P9AWwA==
X-Received: by 2002:a05:620a:d8e:: with SMTP id q14mr5576904qkl.409.1630007550378;
        Thu, 26 Aug 2021 12:52:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:23cf:: with SMTP id hr15ls2132786qvb.4.gmail; Thu,
 26 Aug 2021 12:52:29 -0700 (PDT)
X-Received: by 2002:a0c:aac3:: with SMTP id g3mr6194576qvb.14.1630007549656;
        Thu, 26 Aug 2021 12:52:29 -0700 (PDT)
Date: Thu, 26 Aug 2021 12:52:29 -0700 (PDT)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b5e6d873-afd8-4c34-b264-34af763c9801n@googlegroups.com>
In-Reply-To: <f8fd58f2-57bf-b2cd-25c1-6a5b01b6fcfc@oth-regensburg.de>
References: <b4f1c9f2-a2e9-4e6c-a8dc-1f6fd261fee3n@googlegroups.com>
 <f8fd58f2-57bf-b2cd-25c1-6a5b01b6fcfc@oth-regensburg.de>
Subject: Re: FreeRTOS on Raspberry Pi 4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2668_1620878696.1630007549154"
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

------=_Part_2668_1620878696.1630007549154
Content-Type: multipart/alternative; 
	boundary="----=_Part_2669_2076974720.1630007549154"

------=_Part_2669_2076974720.1630007549154
Content-Type: text/plain; charset="UTF-8"


>
> >This is where you took the source from, right?
> >https://github.com/jameswalmsley/RaspberryPi-FreeRTOS
>
> >This is a 32-bit port of FreeRTOS, but Jailhouse uses the 64-bit ARMv8
> >on the RPi4.
>
> >I don't know if it's possible to switch back to 32-bit mode is possible,
> >I guess Jan knows.  
>

Yes exactly, I am still looking for an alternative or just writing the 
scheduler myself. 
Thank you for your support

Moustafa Noufale 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b5e6d873-afd8-4c34-b264-34af763c9801n%40googlegroups.com.

------=_Part_2669_2076974720.1630007549154
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1e=
x;">&gt;This is where you took the source from, right?<br>&gt;<a href=3D"ht=
tps://github.com/jameswalmsley/RaspberryPi-FreeRTOS">https://github.com/jam=
eswalmsley/RaspberryPi-FreeRTOS</a><br><br>&gt;This is a 32-bit port of Fre=
eRTOS, but Jailhouse uses the 64-bit ARMv8<br>&gt;on the RPi4.<br><br>&gt;I=
 don't know if it's possible to switch back to 32-bit mode is possible,<br>=
&gt;I guess Jan knows.&nbsp;&nbsp;<br></blockquote><div><br>Yes exactly, I =
am still looking for an alternative or just writing the scheduler myself.&n=
bsp;<br>Thank you for your support<br><br>Moustafa Noufale&nbsp;</div></div=
>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/b5e6d873-afd8-4c34-b264-34af763c9801n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/b5e6d873-afd8-4c34-b264-34af763c9801n%40googlegroups.co=
m</a>.<br />

------=_Part_2669_2076974720.1630007549154--

------=_Part_2668_1620878696.1630007549154--
