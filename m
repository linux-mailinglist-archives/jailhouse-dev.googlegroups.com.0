Return-Path: <jailhouse-dev+bncBDCN3RNB2MDRB6WWRTUQKGQEWBEMWGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23a.google.com (mail-oi1-x23a.google.com [IPv6:2607:f8b0:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id C23CB61DD6
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jul 2019 13:39:39 +0200 (CEST)
Received: by mail-oi1-x23a.google.com with SMTP id 186sf5966220oid.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jul 2019 04:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bd6WaS31i6N5tHzjuKPFN7quIPf7jRpuE8DilI0hD7I=;
        b=AfMVu1ssKtZplEWEnqK0fEi7UJ5YuZsomuImaXxL1HRvoRkcGdIL3kV8Z104u2isdp
         WKJBLy1Iz6Tg5kpPo3jg9yRBbB1EPz8rpkc6BoZ9hYYjtBhTZ44OvfbXICZwjrrQwmiV
         fKZ4Tcje831UyLdFPwvgJnTr0FB8oN8FnMi93iYQQYjmBeRG6KF1yqX9zb8dmHZqi3sY
         I4C1CRFxD1DJpw7qiNk6liYPyTiY4IwQ97wGmKeYpPDy7HhWwdHeY/GIzHrXCF8OeUCK
         MYhKocBCLaUYK5UaF8OOLX1Lq34y484VjLb3DY4TF4PB2rmqwONZ6VYXFPKdvsy0gnem
         +ndA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bd6WaS31i6N5tHzjuKPFN7quIPf7jRpuE8DilI0hD7I=;
        b=cq21Kbh7PPl6hVND6i+Ukc24Aq7aYY4gCHm7ZeJ3shOsN4V6rDMV1yTDpI1T/D6LPh
         LTzqs1iNfFgoo0CVPKjN5rTb1QE6N1+rTuXVMCZLn/nH64dpj64gTO4BMQcF3bdbC5VT
         xxwwKT1Af9/gMzIqrAHtUxaHp3YEOQDPsJtj2jLC1RLt8Espv4Q/h6cc/L9mm5AkjCe/
         QFUfRYjlVGJMmmuOl4tMWGj+tRX/pIIl93fo11rVQFAlcZb+pI4wCHoB5Ygd7rE80+W0
         X0xlvN2L6l3h0PcUojpk8PxLoXEbKNkxDEBcBYN4PkB/niuArGlZqDPcgUqKkml5DpKt
         VRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bd6WaS31i6N5tHzjuKPFN7quIPf7jRpuE8DilI0hD7I=;
        b=J17SzU7oRgeCm21Cy+F632vQCUHRbuXKGAxXAKl/9eI3PVNACfFZodByW5bKkUT+3Y
         3OZy+ulTUIHMKHZhmq5GFv7/VPk1ZwrY5deNf6pZ84niqBZs2ZrbQC9PpaOX7omuuhwN
         gcCMvW/Yv7YFiBdRoSuQ1gnuUP+6wrSWcxBel9msoh2do5jWLq3Icgn3gVUrvyw5EbV5
         m0VgjQeAjzRoEDbKnU71LKSACz0M3jnwCb8EaSC3noEUlOpg8eRWffT3vXkF56An4swX
         iO5M6bST1v8wGPuSzRK6wfbyXS5DbHY2kacgP6K0tjla0Kjw2n8zbnejF+y7N5FU299w
         MkWQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV8FWKbK9OGd7eGx3CRO/ze9zDaraMbxMVMLN8oA1ImI51tzmMn
	YfDgl+AvjCoNaq89yxUpI0s=
X-Google-Smtp-Source: APXvYqxqTI54AA7qsTjMnVN/nfr/xgAlfl5JIFLqLlLC2Nc8cIMAzD+8eHeQ1TUDWZhMpAeF3/CQsQ==
X-Received: by 2002:a05:6830:1516:: with SMTP id k22mr13569320otp.189.1562585978592;
        Mon, 08 Jul 2019 04:39:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:e70d:: with SMTP id e13ls1958288oih.9.gmail; Mon, 08 Jul
 2019 04:39:38 -0700 (PDT)
X-Received: by 2002:aca:c3d7:: with SMTP id t206mr8518416oif.138.1562585978006;
        Mon, 08 Jul 2019 04:39:38 -0700 (PDT)
Date: Mon, 8 Jul 2019 04:39:37 -0700 (PDT)
From: jeanne.romefort@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <36184716-8614-4a7c-ac17-ca9da5b92bb2@googlegroups.com>
Subject: Several virtual consoles ?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1942_1480513585.1562585977387"
X-Original-Sender: jeanne.romefort@gmail.com
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

------=_Part_1942_1480513585.1562585977387
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,=20

I'm using Jailhouse to put several linux in parallel. One problem I have is=
 that I only have one serial port and I don't want to use ssh. I don't know=
 if there is a technology compatible with Jailhouse to create virtual seria=
l console to have the consoles of my linux inmates. Can you guide me please=
?=20

Best regards,

Jeanne=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/36184716-8614-4a7c-ac17-ca9da5b92bb2%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_1942_1480513585.1562585977387--
