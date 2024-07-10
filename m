Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBTUAXC2AMGQEQLQXARY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3b.google.com (mail-yb1-xb3b.google.com [IPv6:2607:f8b0:4864:20::b3b])
	by mail.lfdr.de (Postfix) with ESMTPS id C735292C932
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2024 05:30:23 +0200 (CEST)
Received: by mail-yb1-xb3b.google.com with SMTP id 3f1490d57ef6-e037c3d20a6sf10507416276.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2024 20:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1720582223; x=1721187023; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O4S6jvZ7tofQnteip8hWnaK5hqpG7fZ/h0bimN9NgwQ=;
        b=fsw5F3elqNj6o3vtvddZZ4GFqjjcBbin8Cvl8fNUNN8pDlWr/pe2M+d1lbhQhSjQ/W
         lBMI+FivekG9mCO9W/9nxuxqqZrt99+YFUGtj8ijm+anvaNuuQhYCK7V9x24u5DgtV7O
         uNvtjT1dhkE6YCgWT0qlzEsMCYlw/fdk85WuBJYBe4uuAo2Z00y1gw9pygnRAxc7pa2+
         CPZWnYwAhXjQAWk5uyhaWgr8zH/l+AZydqj6jrOfxUyye4necK/KSKV7PukkC/56ALuh
         D9iWINqqHlftMd1BmD9SYu7/2XigqW1Zt+VYvIUOlxPUKPzvaEOgAr/eaLEd4M4V546F
         mlNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720582223; x=1721187023; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4S6jvZ7tofQnteip8hWnaK5hqpG7fZ/h0bimN9NgwQ=;
        b=YyQX7Hl8IoRmqzVcl16QfaF+WQ+1vOIQOwlyI8nhajO4cqdCwlCvqXa3jmUiFPvlWZ
         ZFbSV5Dx73Ee/esCXmP9Pi0kaYVaixe5S7HF18TFAE0yQXucgQj4j+jB5z6TgUbczTfJ
         h++BA5e5+uoiIp64D1Bj+9PFHTZrbHeE7zM8/WZBHh5JYo+WKQO+LHtCrO1y699fQss8
         YlOU3hfBcH2Crta53XoX0w/BQ+8nXeuzv46B4/8i0YVZ/piDLW7ahfV4b63FPkTdTZRG
         x8QfBfevs8hHc6KqwZYUz//2a+kEnm2I1oAaQR8RqUEeI895gaijJQywiDsba3KMmUBu
         +5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720582223; x=1721187023;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O4S6jvZ7tofQnteip8hWnaK5hqpG7fZ/h0bimN9NgwQ=;
        b=c7P9x+Z/JvOUvEeJ2iRQ4LJ5qIfwKyhMfRZ1Ob3BG3rJIKMeNwpwstqt8dtobaH7aZ
         T4z1IsO9m1kK5so5wQ4j3VRd2uKfDNmZlKvsYVkTBQAuqAZx1KOGWdUVzj8Bk0PqI8ch
         j4ujw1F6xCtMD6Ydi0nmTDhsg8FCTgGPu8mPqMYZzriLJtEkYSWmJdJlfiSvIL63xEI6
         k8NRDRj3rEAuInzdslb7q4b6K9Fm6rH64sLkwyyeSIxAqgdur7Jg1MjKrfga9WWiihP8
         kY4jA3whIyYdj/gSJ1D3p1PO1pJ9vfHrN8DjDNrgJVa7QtkCb2JgZSGo3h88CbDjnkje
         jR5g==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUULvoBfuxdKL9k23cFINSmS/lg6MmrL+tjuiBYI/TeK/pP+Km00l6WqZFQMVS4Wqs3RmfdgbzJb/W8XuLv1qDSg6qUMeHe///YkI4=
X-Gm-Message-State: AOJu0Yz3ZyOWbpCOSrg8v2fVqz6pbuW8vZsJvRVJl3NfVsOBXHqz2Rq0
	LHh/wnQHjIVswKNiYt2c97mhYYT32flJyaeUhMj10Qv9f4LILoqi
X-Google-Smtp-Source: AGHT+IFm/3VVYBTFlqR8dzILSLHqSNFEjwmxLtgogaTAAAIuano7K/5Cg7wFRy+nlsxqcLuf36eVqA==
X-Received: by 2002:a25:f503:0:b0:dfd:b613:cd5f with SMTP id 3f1490d57ef6-e041b07042cmr5149295276.5.1720582222695;
        Tue, 09 Jul 2024 20:30:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:1006:b0:e03:2512:6e62 with SMTP id
 3f1490d57ef6-e03bce353a2ls9060701276.0.-pod-prod-06-us; Tue, 09 Jul 2024
 20:30:21 -0700 (PDT)
X-Received: by 2002:a05:6902:1ac9:b0:e03:572c:30d8 with SMTP id 3f1490d57ef6-e041b1e39efmr276037276.11.1720582221243;
        Tue, 09 Jul 2024 20:30:21 -0700 (PDT)
Date: Tue, 9 Jul 2024 20:30:20 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2f1d07e7-fa2d-4336-8433-1a41fd7d2dban@googlegroups.com>
In-Reply-To: <9a5eb3d1-06fa-4e78-9311-955f8d60e149n@googlegroups.com>
References: <0a9db60d-e86b-4b33-b7d1-d609b9f786d6n@googlegroups.com>
 <e9bb3fdc-1bcf-4554-b34e-55f0e21c993en@googlegroups.com>
 <a7287bcc-f3a3-460c-bd92-cd118fef4e99n@googlegroups.com>
 <c4f9e9c3-c55d-48ac-b51a-f19e7a018c79n@googlegroups.com>
 <9a5eb3d1-06fa-4e78-9311-955f8d60e149n@googlegroups.com>
Subject: Re: Buy DMT mushrooms chocolate bars only
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_76194_745735344.1720582220591"
X-Original-Sender: asahrandy54@gmail.com
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

------=_Part_76194_745735344.1720582220591
Content-Type: multipart/alternative; 
	boundary="----=_Part_76195_206954134.1720582220591"

------=_Part_76195_206954134.1720582220591
Content-Type: text/plain; charset="UTF-8"






https://t.me/motionking_caliweed_psychedelics

psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing 
effects, you get from eating the Mushroom and polka dot company chocolate, 
they are also a great way to microdose magic mushrooms. Microdosing magic 
mushrooms in the form of consuming mushroom chocolate bars have recently 
increased in popularity.  https://t.me/motionking_caliweed_psychedelics

https://t.me/motionking_caliweed_psychedelics


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2f1d07e7-fa2d-4336-8433-1a41fd7d2dban%40googlegroups.com.

------=_Part_76195_206954134.1720582220591
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br /></div><div><br /></div><div><div style=3D"align-items: center; c=
olor: rgb(95, 99, 104); display: flex; height: 48px; justify-content: space=
-between;"><div style=3D"overflow: hidden; text-overflow: ellipsis; white-s=
pace: nowrap;"><span style=3D"font-family: Roboto, Arial, sans-serif; lette=
r-spacing: 0.25px; line-height: 20px; color: rgb(32, 33, 36); margin-top: 0=
px; margin-bottom: 0px; margin-right: 16px;"><br /><br /></span></div><span=
 style=3D"clip: rect(1px, 1px, 1px, 1px); height: 1px; margin: 0px; overflo=
w: hidden; padding: 0px; position: absolute; white-space: nowrap; width: 1p=
x; z-index: -1000;"></span><div style=3D"font-family: Roboto, Arial, sans-s=
erif; font-size: 12px; letter-spacing: 0.3px; line-height: 16px; align-item=
s: center; display: flex;"><br /></div></div></div><div role=3D"region" ari=
a-labelledby=3D"c2560" style=3D"margin: 12px 0px; overflow: auto; padding-r=
ight: 20px;"><div style=3D"color: rgb(80, 0, 80);"><div><a href=3D"https://=
t.me/motionking_caliweed_psychedelics" target=3D"_blank" rel=3D"nofollow" s=
tyle=3D"color: rgb(26, 115, 232);">https://t.me/motionking_caliweed_psyched=
elics</a></div><div><br /></div><div><div>psilocybin-containing mushrooms. =
Aside from the fantastic, mind-blowing effects, you get from eating the Mus=
hroom and polka dot company chocolate, they are also a great way to microdo=
se magic mushrooms. Microdosing magic mushrooms in the form of consuming mu=
shroom chocolate bars have recently increased in popularity.=C2=A0=C2=A0<a =
href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" tar=
get=3D"_blank" style=3D"color: rgb(26, 115, 232);">https://t.me/motionking_=
caliweed_psychedelics</a><br /></div><div><br /></div><div><a href=3D"https=
://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank=
" style=3D"color: rgb(26, 115, 232);">https://t.me/motionking_caliweed_psyc=
hedelics</a></div><div><br /></div></div></div></div><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2f1d07e7-fa2d-4336-8433-1a41fd7d2dban%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2f1d07e7-fa2d-4336-8433-1a41fd7d2dban%40googlegroups.co=
m</a>.<br />

------=_Part_76195_206954134.1720582220591--

------=_Part_76194_745735344.1720582220591--
