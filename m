Return-Path: <jailhouse-dev+bncBDDYHZXV2EIRBBEZZGVQMGQEAGAEP7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x338.google.com (mail-ot1-x338.google.com [IPv6:2607:f8b0:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E678095B6
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Dec 2023 23:51:49 +0100 (CET)
Received: by mail-ot1-x338.google.com with SMTP id 46e09a7af769-6d813612d94sf414951a34.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Dec 2023 14:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1701989508; x=1702594308; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cwtSipPb94b77Jx6C0t//qAiWEpVISPVVUI2TVbv74=;
        b=XHdsooVcXfOfmOsrPqlaV8REjyI5GEAHPM97/khWd+Vkmtlgps6//O+ZLfM4fg6IJH
         DsoAQv+O4fY1LJutndSXD/8eB3HU1EEEh3LIPZwzBqrJdIjCC+T2OlSWPpUe90OQfpzA
         VXfUPupu20qWbKEThiiNlBGoeaCCcCKKuyvqgwqpD8/DKVdsdhRzXZADBWRdj1x2q7VM
         l7uSqvZoEg5tyIT18kusmR7VFoDiXIQsaZ+y0wTINgyBGPDwkCronMhu1H4/qxUueNvy
         IxQt84e7IBpvV2nOv9a8T1duVgcci7ituly/zL9alvulizL3B8tE6FA2A3VuLwEYg0Vk
         R3xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701989508; x=1702594308; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cwtSipPb94b77Jx6C0t//qAiWEpVISPVVUI2TVbv74=;
        b=f5IpzY6BbLzq6nX5OdxhQ3M3B5HeYCQp6JUhPue4ZH0zi9mTlKPoaSoxfdRhya+8sP
         N8UjhX0K5lFL1L+Qjk9Zf+w4HlY+pGwTKuO38ysy/f93wetC7gXg74V8z9r3UlCWZff0
         QMSGgnQQ4QP/+aCNZlUR7UqxYY4QgeoPfzWYy/GqPs4fMtbuajImOMKDkVb/NlSHA5ld
         nl1qxSIK+x7YnDv5IpC4N2JUtrXcKFnaqBIZ3T8FE5aW8QvilZQHo+ycDA7w0piibn/2
         RJjSTHRptrVrJm8ADgqPbK2N/X+X73DkcBZd/Ly3RAW4PSpSq7//QweTvubOqzTlKIi6
         +szQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701989508; x=1702594308;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cwtSipPb94b77Jx6C0t//qAiWEpVISPVVUI2TVbv74=;
        b=HB2wni/gGJMZrLjJaPNjU71eDipLsr75iMVOh+8BHSh02TftYEeKBkwFPmkAMOreZ+
         ZVQRUaJ5uDgYLxg4ikXps5vWYkPUSYoRvP7tsRzwVsX/ecVIywXnshcOjuw4Sr1Ct+rE
         Z7omWdgc2nfHj0xgpouZKW191s0rsn+lOuCkMfsmOtLcCdOg6yypPMRUSDoRI2Rz5txR
         a9eaLrhyVjWMmBGBSZWh0cOeFW9mOU7kqnAA5r0PJq60MhKrvxO9lsSgmTO370mEGv/2
         ZQxJMUHzMHxcH40ELV/854v87NQGm2y448y8YwxeFKf2NTBZx0MwvNAutEKeSKo5VECJ
         iXGA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yw8lZ3Nj5GSX7XQwQ/tCmOaBSgHvFp//k2LYLaUV04WD7kOXrwr
	UlArvkBtrBPgq3COW3Uh8Vo=
X-Google-Smtp-Source: AGHT+IHwD2A6fSAP5OuUBg+ldbTVHj/GLL4xoge5PPom647D+4bZyXf9PFFxhYyfQT9mBqeswyIx3A==
X-Received: by 2002:a05:6820:a08:b0:58e:1eaf:7dbd with SMTP id ch8-20020a0568200a0800b0058e1eaf7dbdmr7500784oob.0.1701989508635;
        Thu, 07 Dec 2023 14:51:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6820:1b8d:b0:589:f693:e94a with SMTP id
 cb13-20020a0568201b8d00b00589f693e94als1895284oob.2.-pod-prod-08-us; Thu, 07
 Dec 2023 14:51:47 -0800 (PST)
X-Received: by 2002:a05:6808:2210:b0:3b9:ddc7:d533 with SMTP id bd16-20020a056808221000b003b9ddc7d533mr1813457oib.6.1701989507587;
        Thu, 07 Dec 2023 14:51:47 -0800 (PST)
Date: Thu, 7 Dec 2023 14:51:46 -0800 (PST)
From: Kay Deleppo <kaydeleppo@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6009a65c-e67b-4f07-8ff5-b520c3e822bcn@googlegroups.com>
Subject: Cardiak Drumkit
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1874_732344870.1701989506894"
X-Original-Sender: kaydeleppo@gmail.com
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

------=_Part_1874_732344870.1701989506894
Content-Type: multipart/alternative; 
	boundary="----=_Part_1875_577408859.1701989506894"

------=_Part_1875_577408859.1701989506894
Content-Type: text/plain; charset="UTF-8"

Cardiak Drumkit\nDownload Zip https://shurll.com/2wIZUY\n\n\n\n 
eebf2c3492\n\n\n

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6009a65c-e67b-4f07-8ff5-b520c3e822bcn%40googlegroups.com.

------=_Part_1875_577408859.1701989506894
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Cardiak Drumkit\nDownload Zip https://shurll.com/2wIZUY\n\n\n\n eebf2c=
3492\n\n\n</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6009a65c-e67b-4f07-8ff5-b520c3e822bcn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/6009a65c-e67b-4f07-8ff5-b520c3e822bcn%40googlegroups.co=
m</a>.<br />

------=_Part_1875_577408859.1701989506894--

------=_Part_1874_732344870.1701989506894--
