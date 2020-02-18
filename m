Return-Path: <jailhouse-dev+bncBCI7LDNNRUPBBAMUVXZAKGQEUDXKLUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA23161EE7
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Feb 2020 03:20:50 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id y15sf6474048ljh.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 18:20:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581992450; cv=pass;
        d=google.com; s=arc-20160816;
        b=x0XiukzM7JJrE5rh+zusqU7qiurflJJ0krfGa36iftZPQDxEcM4oqfe2HhFKy46hsw
         TXNz3AMTf1YZTLdT5NAbjhebFw5VAWOCfZvKShfU6dasATp6ah2uV+fxwM/hpnzgIJOt
         7dkKwOsL6dU8ABj1GiPQ4vyK5Sg8i3wSvZ5KoBgx/RxjOp+PvQIcR9vZjoLFk+9S1xqM
         Jet6khTuuMm1VqibK/PBZ3YCRYrYpsfNu0OR/ymUKdLDeZRVbT6UtRcO10paz4JxGWLk
         s2/9AbcMLrspymN0coqnA++gDVuJer3FWtexs3MLAaryPpoLKfsDCIA5Zi4XTGT6L6mx
         F6qA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=LY9EUy1Wzg7FiNcfkviKcOuBJnIbBL4p8Fz9V9430eM=;
        b=UIuL0UIKUqxMwZUM6+UaWUJzSqejknRcDkWxzUR+M+qAbOvRCCKgaCuIiRRJps1ZsA
         18IcG+MfSCZnBacMgyQGRRY9lfSutdsisfK/8UpxF1YbHfLg7N+MfPPPWFZVkK2HpIy3
         GEGT8x/4yrlgyyXMdMJcHFjTu5KrgaVtd5e6+Eun0e4Ask4/46kqCtsZ1I1HuD+TamfP
         bF6/nRdgKlQG3qf9xiU0IdBi5xz4z7Unh5iPszwjOYcPVZGul0WM63zjLbkW4A0+yO83
         Ma/tXd9J3hPeZQL+GC4MVTdLQKqPpQDRGLIKVJ+eoKWemvSqnNA6tukNw9VwMq7RSY40
         IyqA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=G76WfcSo;
       spf=pass (google.com: domain of mamys745@gmail.com designates 2a00:1450:4864:20::442 as permitted sender) smtp.mailfrom=mamys745@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LY9EUy1Wzg7FiNcfkviKcOuBJnIbBL4p8Fz9V9430eM=;
        b=idYSQVwkv5DyXTCCFNavaUld6RZjGj9xZTVuZ9n4aCYAFxrwmk54oWDOCuReaj7sfp
         /24lbmFVSxnzsNytf+tbdlRd1gAhiiHnTmC0Cz+KUm3TDHAMKGCjrLe3Q/060kEfZBit
         SVCUuebUsSttC+WLoiFQyt9l6XYVoXMfZ4HAlme4ajC6WjK4ZGQDNRqirSVIdKjivNKa
         9aSba9PLR8ScyBSqeUdgiBgut3Zttn/WSCARUBzxSQRx0nDjzryWcevc3h7k3mbcOwTp
         vFvOds9YDHJf0OHBE0xmFxQs0bhADpQGXGFahdHTn+Kiq3W/+p5k3GftsYBj2L8I5dMN
         Op2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LY9EUy1Wzg7FiNcfkviKcOuBJnIbBL4p8Fz9V9430eM=;
        b=mwX2Eb3YG/KlWPHPewX7sOxMzVx7UC+mUxcj86T7Ik7XNdBM06R3zDboh/xYHQ4HkN
         hkiRHTy/Fbu5cP46hBfEMyGYmUmET3iVQurkoGJUWa3wgzt6AP36sPUbmLepc78MQlTU
         1pDujXf68jj8KGJj4iAYUQ3Qg7rwfCrCufkq9zExqVqZ717sIYgRu7nGT9vW/ah4A+6O
         4s5s7YxF6h2NjSolgxVT4CHeXG89ugHTNs/6AZDZvvUV2bCyDbYyW8TZTcFBQIPXlH10
         2Nrc+GC9lhu67wFWnp3jK45cUcsn+7DSSdC9cX1Glf3LWqRNsLJj3ZyyBJJQHxqy7wJp
         0Ucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=LY9EUy1Wzg7FiNcfkviKcOuBJnIbBL4p8Fz9V9430eM=;
        b=MkyJm6TmfEGGZ5pjDiBUwz1DG6RXUD4wDUvtt/QLj8L2e2eDS0w+vCBe4p966hunIV
         UQq7Q+AymZLOwqnW5GIPp6EgMd/SXz72FGUKiVFrOF6BB9Z9Cxs/GaMMXYEuG0BgpZTj
         VEVeSzdCl4KcgTeEQ4cpcL8fT430pHIjjRPGFR+xRanJQA4M7Iim80CqC3X1meNrjXj1
         b7bQi5wA/52G9Jl6Tv4dxyXnZuvR6ehKQFmVKoISodu2nWKBJ3o8KpTqQVqD9LjwV5K+
         qfSmKSuEXtDYLx6ekPnhLwlKf4HPEg0aKYZXdhxn3e/gryTn7RGDazf3RmzMBZsxchOw
         peCA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWEXTkvRXmD7ClRnQ79RcIL+NkH6PreDTXHj5BqpsNWgIjgEbtu
	YuC7yODB30cIfMCO6WXsArw=
X-Google-Smtp-Source: APXvYqw/7cOlMwyEhZ7luFY8xMVoc6/kVbVyzOtAPmr9haYHnEdt+AFiePdwTEK15EiEgM77EExfXg==
X-Received: by 2002:ac2:5f02:: with SMTP id 2mr9495565lfq.170.1581992449954;
        Mon, 17 Feb 2020 18:20:49 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9516:: with SMTP id f22ls2388901ljh.2.gmail; Mon, 17 Feb
 2020 18:20:48 -0800 (PST)
X-Received: by 2002:a2e:81d0:: with SMTP id s16mr11619453ljg.166.1581992448789;
        Mon, 17 Feb 2020 18:20:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581992448; cv=none;
        d=google.com; s=arc-20160816;
        b=RfhL47F44PRAAtjnU7TEgTYiyiuTNf1G6WI1n9SDrjXISoRbAUheyza+EaiH5aKIde
         zql9v7u3Wzv1qp1ng/rsfR9gMfxqws2mrZQSlls4qVwVCB4ojFkJLjTiTRYHrB1HrGjN
         3aq1RwRUa1uMB8/c4Ss2ySMFZCTj3OhBdBo8qlRhP0akGC9BQYMotqAeF0xzOKDxf6Rq
         bEvif9HwdeoJNMwziEBlgCiIHX2e/9ouWQyteib4qc8kBYPrrRmvhAcYQr1v5qqt3IBA
         Rrn//JF4E5t5EfQSpQKkcJgsSXxWfbci+ItEmyfu3Q6suJ5u33X4UIdaWONH5PduavCR
         E6Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=on+xf5431FpdykHeJrjURlAXjPIgWf+Va2djwfIb+L4=;
        b=uNgRl6TQHX1XXm/3Z8fN2+U5KAx4kf2NwzCIORiURZrKEhtID+IPJu0hP4Bk/JQpXa
         waPzuLq4OUWGTjVPET7HZ4SymIV8f7BjSTIeRtGB0YCZh0IzguuUdVLffIK8L+UFwM8W
         zKOmzh3GE7jtH2k2BVi9sgrifbPRMoPGJjrdMJzlTOrGgA0H0KMt3vBUBN+Hld0T6t3L
         4WvjnpAp5Wgli66hHAocvNNKJAyl/9+GXjLf3P7BEbPGxwDrIeYxy3X+jxxerL65+nQ6
         CQ++0c9WnQ9E1jBTAqbkjcM+oFD2OdhdPPzt74RlRmSjIt8HdoIuvm0nc12WAxMegoal
         Ep7g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=G76WfcSo;
       spf=pass (google.com: domain of mamys745@gmail.com designates 2a00:1450:4864:20::442 as permitted sender) smtp.mailfrom=mamys745@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com. [2a00:1450:4864:20::442])
        by gmr-mx.google.com with ESMTPS id a11si132736lff.0.2020.02.17.18.20.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2020 18:20:48 -0800 (PST)
Received-SPF: pass (google.com: domain of mamys745@gmail.com designates 2a00:1450:4864:20::442 as permitted sender) client-ip=2a00:1450:4864:20::442;
Received: by mail-wr1-x442.google.com with SMTP id t3so22002546wru.7
        for <jailhouse-dev@googlegroups.com>; Mon, 17 Feb 2020 18:20:48 -0800 (PST)
X-Received: by 2002:a5d:6646:: with SMTP id f6mr27043494wrw.276.1581992448517;
 Mon, 17 Feb 2020 18:20:48 -0800 (PST)
MIME-Version: 1.0
From: Marvella Patrick <marvellapatrick1@gmail.com>
Date: Tue, 18 Feb 2020 03:20:36 +0100
Message-ID: <CALCFPMXtyR1QsT17jMVqS5D4m1673rNvOiXpunxGxdO6bVG_uQ@mail.gmail.com>
Subject: 
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000ee71e4059ed05189"
X-Original-Sender: marvellapatrick1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=G76WfcSo;       spf=pass
 (google.com: domain of mamys745@gmail.com designates 2a00:1450:4864:20::442
 as permitted sender) smtp.mailfrom=mamys745@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000ee71e4059ed05189
Content-Type: text/plain; charset="UTF-8"

How are you doing today

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CALCFPMXtyR1QsT17jMVqS5D4m1673rNvOiXpunxGxdO6bVG_uQ%40mail.gmail.com.

--000000000000ee71e4059ed05189
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><span style=3D"=
color:rgb(32,33,36);font-family:Helvetica,sans-serif;font-size:22px;font-st=
yle:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);display:inline;float:none">How are you doing today</s=
pan></div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CALCFPMXtyR1QsT17jMVqS5D4m1673rNvOiXpunxGxdO6bVG_u=
Q%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CALCFPMXtyR1QsT17jMVqS5D4m1673rNvOiXpunxGxd=
O6bVG_uQ%40mail.gmail.com</a>.<br />

--000000000000ee71e4059ed05189--
