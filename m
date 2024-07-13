Return-Path: <jailhouse-dev+bncBD37PS7EWQCRB3HZZK2AMGQE7UX24BQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113b.google.com (mail-yw1-x113b.google.com [IPv6:2607:f8b0:4864:20::113b])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD679306C6
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2024 19:44:14 +0200 (CEST)
Received: by mail-yw1-x113b.google.com with SMTP id 00721157ae682-65f94703b61sf12771737b3.3
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2024 10:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1720892653; x=1721497453; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=um8yBaKG19zGJ6Wy9KxPeyNGfN789oioUNYVYcWmzYU=;
        b=sUGtiCr8u9LSP/IpPK+t4Oc8fDcvEGuRY5AKjgrKQuLNbIfQhedeiZOs7QjreWirwv
         fHzIaQw7NxcbbhcnqccBkek96Sf10D2GoXGWa5Ev0S+P0roy0aP4Sx1tngyQH0Csr3GW
         ETKQA0MahyigJue+584Z93Oxe53PZ+X+c8e2TOTDTpNq6lxpkwaNOLMjXoI4Jv+eKLr0
         8kR9Fyn15AXYlzQoOVLK1X7aCGGJ5lwOAsaMTmo439MhHp5XveesUOp5/uLHatn2R2pX
         3sByOqAM8Vuv/kuf3IWZHhpXHG/wfi1Cq39un0CIk1ugsbOq3SN9a0iPa2c27pBk/xJf
         tRqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720892653; x=1721497453; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=um8yBaKG19zGJ6Wy9KxPeyNGfN789oioUNYVYcWmzYU=;
        b=Fg4eEjQ55p8lBF9Y9ljqTiUVfHm//+ZyF3+iP5/L/aM4NsRLwRsKGezYIuO7DnFaAW
         XK/WYaNhizMAcl5dSjIeyKr+eLSWS59x0boiPSdAnIcFpQCGn/cBwSlWoLq0hw0Tj/gj
         zr1hMyWi8EWvmMqSr8xAPgyo8UD1+/6/NIYFtRHhn4Ut+9bTcYFQj1Q3WlyXtXCSdjZ/
         muTY4VOwHrz0PvvWZnhvlTRR8N/cqUROnACJHLPQCuzb1TAOQ6rtshTF70mgavsku1eK
         yzSov97N1snIg6BD2KhLHiekji9GKjKr1qhuTn74y/4XQHg+AWTBgdC6GauAQCxQZXYA
         ketw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720892653; x=1721497453;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=um8yBaKG19zGJ6Wy9KxPeyNGfN789oioUNYVYcWmzYU=;
        b=K/AACduR7N2Q7gWXah33E2ni27pEL7X0kC6Mjcypc/y/ppja9Inf/3AW/BKVvU5YVt
         /GgYTRc+SnS8m+70noxgVFldtyTwShPwNMGYGXVpMacmAsEaW8/+Cat73H/+ZiE1bfzX
         in3SLhJRIkx30A0HkY8mwDgpn+nkbR2vpra8QKLMCU7voJb7SdtOu5vS4nodJTJQMivB
         PWDy/pzxE4y/zOEV72LfisTUDkO+3eNScvtXA8uMd7Pu4WqeVqOUxwGXqbsmrhTdtOFf
         0cM4XBjbpWGK/iyf1n1GAbPXGURNvEVDN1h3+n1veOlLxRdcmhBo/HSz7SlfrXpkwiJO
         wCCg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWkX9gyESqQF5OdVhs4MvEo5nnkDHUTAY20d93PjzNShdE1V4wt6MRq7w2dC6x8k+CeLi4B0TteBVS90vX4frMKxn9J6a2Y1X6tmNs=
X-Gm-Message-State: AOJu0YyAca0oes4CnHigopyfaMjk16YY7DKUKKyRtbT772eWDtfbcNJg
	Y7a+rM5wHy6ViQJG5VYA8uojKiYa9UAGvI7qXnNov9pU+gu+BSGs
X-Google-Smtp-Source: AGHT+IG8WmDb8Tfr9IS/2EJxMS4HMEYwaw+0M6F/hACp3ESZhHvPVCCXh/L3QEpEe+zfT2XCs7wgsw==
X-Received: by 2002:a25:d30b:0:b0:dfb:142a:ddb with SMTP id 3f1490d57ef6-e041b178500mr17157009276.44.1720892652804;
        Sat, 13 Jul 2024 10:44:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:2b92:b0:e05:a978:7726 with SMTP id
 3f1490d57ef6-e05a9787c8els296006276.2.-pod-prod-00-us; Sat, 13 Jul 2024
 10:44:11 -0700 (PDT)
X-Received: by 2002:a05:6902:120b:b0:e05:a1df:5644 with SMTP id 3f1490d57ef6-e05a1df5d0cmr72019276.2.1720892650978;
        Sat, 13 Jul 2024 10:44:10 -0700 (PDT)
Date: Sat, 13 Jul 2024 10:44:10 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <808f0d80-24e8-44f0-ad9b-93be9473040bn@googlegroups.com>
Subject: WERE TO BUY MUSHROOM CHOCOLATE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_495588_1300634738.1720892650375"
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

------=_Part_495588_1300634738.1720892650375
Content-Type: multipart/alternative; 
	boundary="----=_Part_495589_2146520868.1720892650375"

------=_Part_495589_2146520868.1720892650375
Content-Type: text/plain; charset="UTF-8"

Mushroom Belgian Milk Chocolate is not only delicious, but it equates to 4 
grams of   

https://t.me/motionking_caliweed_psychedelics

  psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing 
effects, you get from eating the Mushroom and polka dot company chocolate, 
they are also a great way to microdose magic mushrooms. Microdosing magic 
mushrooms in the form of consuming mushroom chocolate bars have recently 
increased in popularity.  https://t.me/motionking_caliweed_psychedelics

https://t.me/motionking_caliweed_psychedelicsWERE

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/808f0d80-24e8-44f0-ad9b-93be9473040bn%40googlegroups.com.

------=_Part_495589_2146520868.1720892650375
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Mushroom Belgian Milk Chocolate is not only delicious, but it equates =
to 4 grams of=C2=A0=C2=A0=C2=A0</div><div><br /></div><div><a href=3D"https=
://t.me/motionking_caliweed_psychedelics" target=3D"_blank" rel=3D"nofollow=
" style=3D"color: rgb(26, 115, 232);">https://t.me/motionking_caliweed_psyc=
hedelics</a></div><div><br /></div><div>=C2=A0 psilocybin-containing mushro=
oms. Aside from the fantastic, mind-blowing effects, you get from eating th=
e Mushroom and polka dot company chocolate, they are also a great way to mi=
crodose magic mushrooms. Microdosing magic mushrooms in the form of consumi=
ng mushroom chocolate bars have recently increased in popularity.=C2=A0=C2=
=A0<a href=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_bla=
nk" rel=3D"nofollow" style=3D"color: rgb(26, 115, 232);">https://t.me/motio=
nking_caliweed_psychedelics</a><br /></div><div><br /></div><div><a href=3D=
"https://t.me/motionking_caliweed_psychedelics" target=3D"_blank" rel=3D"no=
follow" style=3D"color: rgb(26, 115, 232);">https://t.me/motionking_caliwee=
d_psychedelics</a>WERE</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/808f0d80-24e8-44f0-ad9b-93be9473040bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/808f0d80-24e8-44f0-ad9b-93be9473040bn%40googlegroups.co=
m</a>.<br />

------=_Part_495589_2146520868.1720892650375--

------=_Part_495588_1300634738.1720892650375--
