Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBQHB6SZAMGQEDOTBEXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id C06998D7A32
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Jun 2024 04:56:02 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id 3f1490d57ef6-df796aaa57dsf4161462276.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 02 Jun 2024 19:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717383361; x=1717988161; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cSA+BdyLrH6I+y8qdXNypwrBqQGNab7rIX1+lehS654=;
        b=rX57YYb0NYFnDaF4p1pRVfPiWva97IAZCg9Wx7ineos/mLqtVLfjym9vkj8XLGxrHY
         gmguxCwoObDLOiu2VIMehdVeIgyafghv6XbZEET4vQs0IMn0hxlKuDyudvtuVFFmSVCK
         kkPxsQzZXBz/cnywn7IAmDbuq0W8uNrak8I+PU9gCpCRDNCwXhl0jTdx9MC5FoKhKey5
         xBdqzhL9oTsql0PHxEnNhhC3fR1rIAzh7u7+TM/Fe64r9N2oceTyeC2ugHJ3Q4lQOoNN
         /au2ecxaGkWWOi7E2jTag9r4fjJ/uGP455auD62X98PlHvxoBYOPDNK1Z5EidStT7+dA
         BJjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717383361; x=1717988161; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSA+BdyLrH6I+y8qdXNypwrBqQGNab7rIX1+lehS654=;
        b=dqpYsyUFo+/DmXCkoTDoF0eiN8mywImBZGbHUb8jxQ0yLLyb4Zi5xqClCZtlJ/m674
         Me8b2GueJcgNFduI8eHD7fnb8/tDWSJdz2hr717AFi2kysLNEPAO+uKkAiCAzjVlTNAP
         9bRHF0BLWM1DDk12jKcE7K7+7xRHkAKoa8XFdiTJ2UUanqO9qHXbiFKIrBFmdbvDY9gq
         UPOr9H0CRsAA2pwBy5DsgUdn22puWWYqZM4hlf4sXiqs91aOvCGhb7dqwmQgACQ6eO4f
         /h9V3TwMU0hgoXGX8oHyypED79U1YCjxcKkCm0vke084eHuDx6Q8icmSwuo4F9ID9cyX
         6qnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717383361; x=1717988161;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cSA+BdyLrH6I+y8qdXNypwrBqQGNab7rIX1+lehS654=;
        b=ZWuDx3wucm6hns++PdXDrp/OY+7nQpv20hZaMnUu0syOuPcnd2y0PDromqc37OVeQK
         v1LQKVLD76Kd5mm36l1zIDeQP3XQzHzdyRy2LylTjZZhpV9mVv4JKqF/OG03exYy+RR0
         5lVtpoCPJyUZXdAMy1hB0m6uhcM/oks28rb3o3JQgMjwKvioAT62X2v0SwVrXM0y8qoa
         9yHe9YWyFWCKdsLTyvgOF8j5lUYU3xF11U2sqoQe/viCUJn7EZyvF6TULDRpU6a5of+c
         P+Ad+Dg/WlHDC0PCIEvGsUv5OOIGCtUFn4z+Vljsdjs5pw8Dirs7qr0MYKxNCWrIzb97
         BkTQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCX0eHexyMfB2H1MYrhjHMaM7P+/iFPcZDK1Oo2YpCIlKJwap0Qd3aVnouiK4N95Dir9VL9YHg19Fsj/neqMQvkX3yrXLuWhxc8zKwk=
X-Gm-Message-State: AOJu0Yx3syJbgW+3jmSHD82uCC92nMiprsQTrj+LZ9Bseduw3pGf5xew
	VEraL+u/NQDRIW+sk4qF3zMuB4N2b6aOFTXi4PpD4M+VSrJTzZWr
X-Google-Smtp-Source: AGHT+IG8rdoZ7PgRUCg3uy50YXdf5ldS9+fQMYcvF+UsV1qTfQHqiq1TbAXyBVb3t5bRHi3GBvTdgA==
X-Received: by 2002:a25:d64e:0:b0:df3:1927:7f4f with SMTP id 3f1490d57ef6-dfa73c06663mr8084237276.17.1717383361383;
        Sun, 02 Jun 2024 19:56:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:abd2:0:b0:dfa:74b4:7e65 with SMTP id 3f1490d57ef6-dfa74b48147ls1126962276.2.-pod-prod-09-us;
 Sun, 02 Jun 2024 19:55:59 -0700 (PDT)
X-Received: by 2002:a05:6902:2b85:b0:df7:8f43:f8a3 with SMTP id 3f1490d57ef6-dfa73a10d44mr2800709276.0.1717383359614;
        Sun, 02 Jun 2024 19:55:59 -0700 (PDT)
Date: Sun, 2 Jun 2024 19:55:58 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <781e166c-e9bb-455e-a0e8-e7fec4d5126cn@googlegroups.com>
In-Reply-To: <28787421-30d1-4cbd-9da2-da23c674bf25n@googlegroups.com>
References: <23ea410a-e2c3-426c-8b7d-3d2a82d94dbfn@googlegroups.com>
 <28787421-30d1-4cbd-9da2-da23c674bf25n@googlegroups.com>
Subject: Re: WHAT ARE GOLDEN TEACHER MUSHROOM AND WERE ARE THEY SOLD ONLINE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_373344_1192187087.1717383358501"
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

------=_Part_373344_1192187087.1717383358501
Content-Type: multipart/alternative; 
	boundary="----=_Part_373345_1144497803.1717383358501"

------=_Part_373345_1144497803.1717383358501
Content-Type: text/plain; charset="UTF-8"

https://t.me/motionking_caliweed_psychedelics


Golden Teachers are considered moderately potent among psilocybin 
mushrooms. Their effects can vary depending on factors such as growing 
conditions, individual tolerance, and dosage. Users generally report a 
balance between visual and introspective effects.

https://t.me/motionking_caliweed_psychedelics


     Effects: Like other psilocybin-containing mushrooms, consuming Golden 
Teacher mushrooms can lead to altered states of consciousness characterized 
by visual and auditory hallucinations, changes in perception of time and 
space, introspection, and sometimes a sense of unity or connection with 
one's surroundings
Some key characteristics of the Golden Teacher mushroom strain include:
     Appearance: The Golden Teacher strain typically features large, 
golden-capped mushrooms with a distinct appearance. When mature, the caps 
can take on a golden or caramel color, while the stem is usually thick and 
white.
     Potency: Golden Teachers are considered moderately potent among 
psilocybin mushrooms. Their effects can vary depending on factors such as 
growing conditions, individual tolerance, and dosage. Users generally 
report a balance between visual and introspective effects.

https://t.me/motionking_caliweed_psychedelics

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/781e166c-e9bb-455e-a0e8-e7fec4d5126cn%40googlegroups.com.

------=_Part_373345_1144497803.1717383358501
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><a href=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_b=
lank" rel=3D"nofollow" style=3D"color: rgb(26, 115, 232);">https://t.me/mot=
ionking_caliweed_psychedelics</a><br /></div><div><br /></div><br /><div>Go=
lden Teachers are considered moderately potent among psilocybin mushrooms. =
Their effects can vary depending on factors such as growing conditions, ind=
ividual tolerance, and dosage. Users generally report a balance between vis=
ual and introspective effects.<br /><br /><a href=3D"https://t.me/motionkin=
g_caliweed_psychedelics" target=3D"_blank" rel=3D"nofollow" style=3D"color:=
 rgb(26, 115, 232);">https://t.me/motionking_caliweed_psychedelics</a></div=
><div><br /><br />=C2=A0 =C2=A0 =C2=A0Effects: Like other psilocybin-contai=
ning mushrooms, consuming Golden Teacher mushrooms can lead to altered stat=
es of consciousness characterized by visual and auditory hallucinations, ch=
anges in perception of time and space, introspection, and sometimes a sense=
 of unity or connection with one's surroundings<br />Some key characteristi=
cs of the Golden Teacher mushroom strain include:<br />=C2=A0 =C2=A0 =C2=A0=
Appearance: The Golden Teacher strain typically features large, golden-capp=
ed mushrooms with a distinct appearance. When mature, the caps can take on =
a golden or caramel color, while the stem is usually thick and white.<br />=
=C2=A0 =C2=A0 =C2=A0Potency: Golden Teachers are considered moderately pote=
nt among psilocybin mushrooms. Their effects can vary depending on factors =
such as growing conditions, individual tolerance, and dosage. Users general=
ly report a balance between visual and introspective effects.</div><div><br=
 /></div><div><a href=3D"https://t.me/motionking_caliweed_psychedelics" tar=
get=3D"_blank" rel=3D"nofollow" style=3D"color: rgb(26, 115, 232);">https:/=
/t.me/motionking_caliweed_psychedelics</a><br /></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/781e166c-e9bb-455e-a0e8-e7fec4d5126cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/781e166c-e9bb-455e-a0e8-e7fec4d5126cn%40googlegroups.co=
m</a>.<br />

------=_Part_373345_1144497803.1717383358501--

------=_Part_373344_1192187087.1717383358501--
