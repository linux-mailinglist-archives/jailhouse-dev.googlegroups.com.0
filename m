Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBV7UWS2AMGQESC7IZFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id 238CB92BAFB
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jul 2024 15:25:45 +0200 (CEST)
Received: by mail-yb1-xb38.google.com with SMTP id 3f1490d57ef6-e03a92302d1sf9054091276.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2024 06:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1720531544; x=1721136344; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqVg3kpwKevOTzXR2CC1fJlL313pKqhUHhzJ8uE1YCU=;
        b=SIi0qiZAOofW+rsL9OdVeZHQjmU3G1/SfDXoFOoN2kjST806FJFWxs3trgDxikKmxe
         22nPCnR8kQunq/2iCEq13XILtt5tz3SJj70ut3Ovpj3eDGYD5ZiYUx2Fy9Vdk1FncWaf
         PSs2ks57O2GpUj9f2mpKNMBAxVY2Cy9gt2YPh0cFpFJM7bHAUfVgWabETkQIY0vq+M7o
         5heE4dtM1zkpYNC6YNnAYaPPMYcfL82Jx6BRbT2SHHzdUiZ263vJnmq+ISh/DTzPjC+p
         hIzDsP4r4+9dBU67nS6jcZlbV+DHJ/mXDOxkMFKmu3/U7VlnfoC1mtEE0G5lfLY+y9a3
         tqvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720531544; x=1721136344; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqVg3kpwKevOTzXR2CC1fJlL313pKqhUHhzJ8uE1YCU=;
        b=Cw3cQTv4OSW3hhtNiNbbcA9DynTJy+DuyNhlxyL4FR40ZpS6qVIeEM7ibUyPxzsijL
         LEvmyFA9Trf+Nc6VAn552UPQH3fQcRxaKH/Ib4LhwS2Z66ispmrnUoRNlcbbPO+NGEIJ
         PqIEMC09iuFq2Xz+PFqja2Hu/66+y6c06s+B3d/f8Pbkj7H+Mj3WBm+/Lwpi0LBvP0L3
         I8NKBXKPKqG8zDqg5bak+djMVcveBj+xT3Q01iPNqmIIs6HcoRUZNCyGb4qMfmxmBz/k
         b9hr36N6sERnI35md0aXQGmYlOCTieky2rJ6RBLvkrgScnJ6ei0Yzzmp1SCnl8T8K/n2
         aocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720531544; x=1721136344;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqVg3kpwKevOTzXR2CC1fJlL313pKqhUHhzJ8uE1YCU=;
        b=Y8f64xlJftJOK8GRBxaUhhNFZAZ5oLVlZiuERmkbFt7UBFSTsCvBZupQYrAJ8qAk6W
         ul4zr7PFSynfdjjaoCAO6qWriBJOfOQ0Kmpl4cLeirObvpddzj3DkfTTFF2k/oYxUJiI
         Z2Gr1k5NQljO+5uu6TMgxtQ1YLKJmxSY82dYokRHYRsH1NsS1kXHTiPFaPvAX1N99DWu
         VN7qMxCS/GxzNjVrur8V/NY5GC2tYsm3j1pH7LxygCWPvWSyDhspNoky3Qeupr8aET5j
         lGfMsGrRAnlB8anV8qAKx5GP3zRyhk2OWNGx6OeQn9XjYmVtcLNRXRjKFAZ8QC2D8MON
         HqiA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVFdenaRBaZLDw47N0L1gA7WaTi3iv89brQzOxVffCX2Hehxe59S7ejbK8HvP6T30zv1BkXoNB8JmkUeSApCpMPxDorIcq6Ne0qDp8=
X-Gm-Message-State: AOJu0YyTtexI/UH0haOzzXPZB99JH+GuD862vculXT83oB6FFSonGE/G
	QasrSKpcJp6Y01PKZTyksdtTLpgUEllTfmSez5WLnA1zOal3pHlF
X-Google-Smtp-Source: AGHT+IFFrFNae7YJ5ER06bf/oBmylJkWKsK9hZKeQ0/BD6eS72OXZclRa+eadtaL+/YXvmh5zLzp1w==
X-Received: by 2002:a5b:b50:0:b0:e03:cd9b:f37c with SMTP id 3f1490d57ef6-e041b054c54mr3058656276.18.1720531544037;
        Tue, 09 Jul 2024 06:25:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:1886:b0:e03:aded:7d3a with SMTP id
 3f1490d57ef6-e03bd035889ls8392376276.1.-pod-prod-06-us; Tue, 09 Jul 2024
 06:25:42 -0700 (PDT)
X-Received: by 2002:a05:6902:2192:b0:e03:4bf0:b21e with SMTP id 3f1490d57ef6-e041b03fe4amr187221276.1.1720531542496;
        Tue, 09 Jul 2024 06:25:42 -0700 (PDT)
Date: Tue, 9 Jul 2024 06:25:41 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <717d828e-db8b-4978-81c0-d4701b5cd5a6n@googlegroups.com>
Subject: Mushroom Belgian Milk Chocolate is not only delicious, but it
 equates to 4 grams of
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_134770_1808003718.1720531541634"
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

------=_Part_134770_1808003718.1720531541634
Content-Type: multipart/alternative; 
	boundary="----=_Part_134771_1470910424.1720531541634"

------=_Part_134771_1470910424.1720531541634
Content-Type: text/plain; charset="UTF-8"

https://t.me/motionking_caliweed_psychedelics

Mushroom Belgian Milk Chocolate is not only delicious, but it equates to 4 
grams of   

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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/717d828e-db8b-4978-81c0-d4701b5cd5a6n%40googlegroups.com.

------=_Part_134771_1470910424.1720531541634
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>https://t.me/motionking_caliweed_psychedelics</div><div><br /></div><d=
iv>Mushroom Belgian Milk Chocolate is not only delicious, but it equates to=
 4 grams of=C2=A0=C2=A0=C2=A0</div><div><br /></div><div>https://t.me/motio=
nking_caliweed_psychedelics</div><div><br /></div><div>=C2=A0
psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing eff=
ects, you get from eating the Mushroom and polka dot company chocolate, the=
y are also a great way to microdose magic mushrooms. Microdosing magic mush=
rooms in the form of consuming mushroom chocolate bars have recently increa=
sed in popularity.=C2=A0
https://t.me/motionking_caliweed_psychedelics <br /></div><div><br /></div>=
<div>https://t.me/motionking_caliweed_psychedelics</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/717d828e-db8b-4978-81c0-d4701b5cd5a6n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/717d828e-db8b-4978-81c0-d4701b5cd5a6n%40googlegroups.co=
m</a>.<br />

------=_Part_134771_1470910424.1720531541634--

------=_Part_134770_1808003718.1720531541634--
