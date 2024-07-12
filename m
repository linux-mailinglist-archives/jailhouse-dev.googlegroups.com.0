Return-Path: <jailhouse-dev+bncBD37PS7EWQCRB2EBY62AMGQEFQRZ6MA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B30930277
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2024 01:48:58 +0200 (CEST)
Received: by mail-yb1-xb38.google.com with SMTP id 3f1490d57ef6-e03fe45dc0bsf4363813276.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jul 2024 16:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1720828137; x=1721432937; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JB8M/uMnmmYTbhPejy6BejTZHHpeqb3JD8dNOKQRxfM=;
        b=RrXD8Ps0cfSeoK01Z0KryWh45eyogjjfnA/L7CDSa5ry2JTrMgNVaaJNQXthrMM2DL
         wbVFufCMSmwLzP/Epl09X++dbRunmuPpRxjKbSFarxfAJ0jQy4NWvOeZqt3yIoUFp5NG
         2jLndZQpgcWkcJsCRwwQH1i/aOJZ7fq6Rsou/DjivMhJE6nDHZYOITn18D9KjgRtDyYL
         lrcwuNHga8CreIUkjwIRUO0sRg9HheDpnchXUO9LZE++OoV64sZDgE1faw5SrQZWwxMn
         pK8XBzBnkw3Me41+pMNUSjgXFgSu0QtMf7GRBvngR73CKaQ2XIfWLPlMjcIaDY+Ji8pM
         +zbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720828137; x=1721432937; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JB8M/uMnmmYTbhPejy6BejTZHHpeqb3JD8dNOKQRxfM=;
        b=LkmQmfYyV3AJBNuWBLp8FDlW4PfXGRp6b5qNZRZ5IyqJycCAJiNw7dzMy4ssPqa5vR
         8wQUzo5ACVkEmGHfOwriQGY/ronws3fB5XWkecYMxzjzxrBb47Ug6O/XipnBNTtdzVLo
         TX/d4shqqEE5ZOGD0invsVkaoXYv3P90rGs3Tgu/Mc2SUWtz4tZvZT4Nbtcy6KfRyGzl
         GJgjlySuk9qQ8RkLazkaH5YmG0euF05N8g0dihIXmxe6rpe5X7h8PJ4ceGezdgazQlw9
         0O4Veek6/zO+NTWknGCPeKBhjrEA/fBiovwtiL1rBf+xSJKmMhZdUAddnGciBQdV3xL4
         2rhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720828137; x=1721432937;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JB8M/uMnmmYTbhPejy6BejTZHHpeqb3JD8dNOKQRxfM=;
        b=wTLhR8pJec+lRclPwD14TW+MZCtuQ03r149FaoEIAR4mU9tYcMnXDHvdTMWQN25hip
         3+qe0PcPCYyHhsi9QdV1lna4o8mkY/+9RGsiclasn7fT8LQp7S6/EbUAY5XChMp26d9G
         qPHpSZe/3nYcUOpHG0uXyTstxT+pTIP5se04KPM9bnCghjmMHmLSRzWOAzzZrI8ZLGlC
         D0TtpkfTm2gYg+aECexumx3LX+VGzvoma5IpWjAU0pQe0mXaAAEz+eDFVPo+uRhUnzWZ
         0+/K52gEZ1SNHZBjFps8MZ6Uv650CpSIeCmZMuaVw1EdY3JScIyU4qafww74JjZtXxps
         UyAw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXxaBJIYaQvN5o4yRS0N1pKnl2ReUsz8rkuGGfRh8OXd+qWlmmLsfpYSirMJQi6j2nwWEQO5amTBObasNA+ydlPFL85F7HRKyU26rY=
X-Gm-Message-State: AOJu0Yy7ygqEbuUAFxac5CEFglMLKmh6rcmGKhE53IjPtM+nieC40fxx
	hcCx0v/2HXORlWG8D4xhByKne6hCw8AttEvSpA677+z/qqew62SP
X-Google-Smtp-Source: AGHT+IHdSYQJCE8R6EJKItn8tI/sGJZGKWGcVzPXp8b8vzHO4yKgVoEQrZVRdR8+Qn44WGa9EXWfUw==
X-Received: by 2002:a25:800c:0:b0:e03:6533:136d with SMTP id 3f1490d57ef6-e041b12408amr14900818276.40.1720828137201;
        Fri, 12 Jul 2024 16:48:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:1021:b0:e05:a345:25b6 with SMTP id
 3f1490d57ef6-e05a34528b0ls116610276.0.-pod-prod-07-us; Fri, 12 Jul 2024
 16:48:56 -0700 (PDT)
X-Received: by 2002:a05:6902:725:b0:dfa:849d:3a59 with SMTP id 3f1490d57ef6-e041b143653mr993756276.13.1720828135899;
        Fri, 12 Jul 2024 16:48:55 -0700 (PDT)
Date: Fri, 12 Jul 2024 16:48:54 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <69f1e9a0-1646-455c-8725-c16bfa62f058n@googlegroups.com>
In-Reply-To: <25a41179-e94f-41ea-886b-7a4ffa0f87d7n@googlegroups.com>
References: <25a41179-e94f-41ea-886b-7a4ffa0f87d7n@googlegroups.com>
Subject: Re: WERE TO BUY DMT CHOCOLATE BARS AND MUSHROOM ONLINE FOR SALE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_271426_907795206.1720828134597"
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

------=_Part_271426_907795206.1720828134597
Content-Type: multipart/alternative; 
	boundary="----=_Part_271427_1701001723.1720828134597"

------=_Part_271427_1701001723.1720828134597
Content-Type: text/plain; charset="UTF-8"

https://t.me/motionking_caliweed_psychedelics

Mushroom Belgian Milk Chocolate is not only delicious, but it equates to 4 
grams of     https://t.me/motionking_caliweed_psychedelics    
psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing 
effects, you get from eating the Mushroom and polka dot company chocolate, 
they are also a great way to microdose magic mushrooms. Microdosing magic 
mushrooms in the form of consuming mushroom chocolate bars have recently 
increased in popularity.  https://t.me/motionking_caliweed_psychedelics  
https://t.me/motionking_caliweed_psychedelics 

https://t.me/motionking_caliweed_psychedelics


https://t.me/motionking_caliweed_psychedelics

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/69f1e9a0-1646-455c-8725-c16bfa62f058n%40googlegroups.com.

------=_Part_271427_1701001723.1720828134597
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>https://t.me/motionking_caliweed_psychedelics</div><div><br /></div><d=
iv>Mushroom Belgian Milk Chocolate is not only delicious, but it equates to=
 4 grams of=C2=A0=C2=A0=C2=A0=C2=A0
https://t.me/motionking_caliweed_psychedelics=C2=A0=C2=A0=C2=A0 psilocybin-=
containing mushrooms. Aside from the fantastic, mind-blowing effects, you g=
et from eating the Mushroom and polka dot company chocolate, they are also =
a great way to microdose magic mushrooms. Microdosing magic mushrooms in th=
e form of consuming mushroom chocolate bars have recently increased in popu=
larity.=C2=A0 https://t.me/motionking_caliweed_psychedelics=C2=A0
https://t.me/motionking_caliweed_psychedelics <br /></div><div><br /></div>=
<div>https://t.me/motionking_caliweed_psychedelics</div><div><br /></div><d=
iv><br /></div>https://t.me/motionking_caliweed_psychedelics

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/69f1e9a0-1646-455c-8725-c16bfa62f058n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/69f1e9a0-1646-455c-8725-c16bfa62f058n%40googlegroups.co=
m</a>.<br />

------=_Part_271427_1701001723.1720828134597--

------=_Part_271426_907795206.1720828134597--
