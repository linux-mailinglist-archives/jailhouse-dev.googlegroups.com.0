Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBD7R43YQKGQETJ4YM7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x93a.google.com (mail-ua1-x93a.google.com [IPv6:2607:f8b0:4864:20::93a])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D44F152074
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Feb 2020 19:31:44 +0100 (CET)
Received: by mail-ua1-x93a.google.com with SMTP id 35sf5164573uaq.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Feb 2020 10:31:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580841103; cv=pass;
        d=google.com; s=arc-20160816;
        b=Geli1xH4TfZZyOO+BtnJ0rQKyCuRXdDyf9k9L0itOPCR2OwFgZ8BD2QrqTTTEUXH/m
         j9kZQJPK7bI3xtbAFhjQqaUHTJMNYVeR6WRTbzhvjMqV2n14aL1KQ2wWUw34I6DyVzdB
         pwmEW1hBUpe5I0c3POz4CK5f43em2RwSp166yp/ADQmS+MDKQFxkoNhfbCDBpzlaDa8/
         863Wqnd9doDJn/l3vs2LQIaXw5rler9KYpglJ3XSHxaI/0kBzz5hOZTm5zMfkg174BXF
         lqiJ87hJPZsZ8X1zXRKHT17VBZU4uS4N4j/OFSSgXGLgu0v92Dqe7k6QUyxmSANuNSPP
         61LA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=bP0SV5bEwABNNPePwwm4zr+6EWVfjVKOb3xDyN1t3qA=;
        b=cNbA7rVgfatbwS4yaUYxF8L19YzXjMEYUZ2CtufHT+ViZTDk6vyJLCy9aPOZpla2TC
         +MncdRxif1l0cRe40vpGk5oHY+9HXOux90gJyoubdQGlfKCu+gg+7OsEl/437yT2Welw
         TKZ4EiJb91E4oFv1M6490jPFKFxiKai7lFjNUtuspygQ+haDf4it1AQX8Trf2haiDwp9
         Q9PfmsDFPw8EeZN0HXddo4pxTvxtu5PUUJCHmFkb5O3hQznL9m0B8GnTZrcI1V2dl0/b
         Kr+fhYjK1b3Xup0EcdUkTcblBKBDvf4FpVNfyAYNR1yi94gA0qoHSvQtEl073w7gkDvi
         +SIA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Z80ACFy4;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bP0SV5bEwABNNPePwwm4zr+6EWVfjVKOb3xDyN1t3qA=;
        b=W/mq5/bITJmt29ldO+AuFpU9KZvHhiSKIsvweVZb2VjG6QMJ4xr7A8r6b2qzBrfevx
         6Gw5njS8PI56v4JjEax55C2c5mpiqTqKW3bh4/ST4w/0+cq/LRwk8dTbyOcj0OlaLdgW
         tJTFad9/sFLtflB7okCNzr/aUx0fRBgi2JM5Ij6aSsmgDiMDCvzZ72w5DD9dkWsxOI5I
         a67iOZsk5q2Ga8XJujpgAO9BM+3/DkvOgG9xlz4fXGw5C2NyQICQuWxRYMOy2AwqX63n
         c90aCcvO433Lp7oQ9gasnAnLQcj8mF/iSuh64DZwXOfpDv6WSd7MA4cWG30OZTDCxIDu
         OSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bP0SV5bEwABNNPePwwm4zr+6EWVfjVKOb3xDyN1t3qA=;
        b=naBOeDbLEpSYUBr3rCowqv3qf3GKL+wQUuM9Vjdxk7juwzJXGWXedVoaJYJwTzBBm8
         q+9DKGJ+cSaT4jeZ1SAKLzn6VwQ7/WsMM7HLbsDX0YGMzi+LgtbXG+baLf7IxeHbN4R2
         wXTy9EVSbwY/wz5AuSjdIpgVI2W3OKQQxYbgjbkckyrIHeZvuGH4GI7z9c3IW5ifjV7v
         aaObqDxpJnlVJDKsAkj0rpiED+p9PDPIOZR1YWwgliWKdnZ0aYYkmCG2SGhZyNu5wbIX
         3YcEFF0BOxDYArAfP4+nidZwCS4Mgp1AliL2dd4Jh2NPMRzrYCtqAhGwS1RVzLi0GEtt
         1mPQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWtG/bl7IpI1+6B/wP1hCDH1F6rBeOm/Bpq4dsebeZ3qa9sv2EJ
	WCf5CJWtO24UneSoHhN9Ihs=
X-Google-Smtp-Source: APXvYqyw69B5GKanydMfRf2FVvlBeje3zgRltt5CAHEHu8SgWfEk7x7R1YewO/k6PmCQyv7IzpcElQ==
X-Received: by 2002:a67:ca96:: with SMTP id a22mr19648960vsl.196.1580841103222;
        Tue, 04 Feb 2020 10:31:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:2885:: with SMTP id s5ls1385063uap.10.gmail; Tue, 04 Feb
 2020 10:31:42 -0800 (PST)
X-Received: by 2002:ab0:133:: with SMTP id 48mr18787416uak.38.1580841102671;
        Tue, 04 Feb 2020 10:31:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580841102; cv=none;
        d=google.com; s=arc-20160816;
        b=xSmuFzvOrKjoTQJgo83E85DCYPzVs59M8pbbpu5qEetGTih9i3OI0a9EfyBnRgLTRp
         F33tE9OGPPEk79R5NPIBwzLpC2iPnoAtVFoEbiC/z1/5FTboA4dXWhark3rpWiRxEq38
         bH/1lHTL3Aj8W+Wnid/tqXEnlp+rsA5vZ6Rw6hDPR2C2IwCjUr9NnwsHmQ28k8US8qmw
         oNPvO82UVxxS6czCqi7yZAcd7nEWeKy1bMmtYqfU2Qm5O9caX57FLKNObWpkfQ+6aDYf
         fagDgeRrMJ+RVUOVaPPuZ4KWBUQ/6BmBftohksA/+MPGz3eby9c0IysVck9JSixF/j3L
         2OXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=S3ihAdAI7Gu7SwIrfdQgxu9nuLJaDn+bCxUNiZ+OQIQ=;
        b=BChjcDqoQTTDi6kJ2DQPfSEoJQRxcurqGsqM25Y/BNJvPy4xjzuSfU6rGF0YDK96sn
         mKwVmuQVjWVJOx4irZtR2x4IfPi2HmIgVOjLfdswKJWVot0fIF3OXkGZV2ZHtlpDpHQU
         0sn31RIawZg3vk9dh9KlxBINPz2ox6NOmWG4ZKyfL/CNyOSBmq5RBRBDhVReO2XwrybQ
         gP5bGJ01AhKGT9gFHsSOzVe6JGoFzeh25bykPwdFL4MQjbtnCl5KHx+3a8ptC8GWSoYQ
         lvJZQhSgd4u1mR+1QSu+Cu7PXkioeY9BIg9wFipYX8ZxeW8DfnTYyX/qE/uD3rdx0sSl
         PVhw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Z80ACFy4;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-27.smtp.github.com (out-27.smtp.github.com. [192.30.252.210])
        by gmr-mx.google.com with ESMTPS id n5si738895vsm.0.2020.02.04.10.31.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Feb 2020 10:31:42 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) client-ip=192.30.252.210;
Date: Tue, 04 Feb 2020 10:31:42 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/213747-92db71@github.com>
Subject: [siemens/jailhouse] 92db71: Bump version number
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Z80ACFy4;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.210 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 92db71f257fabd3c08fa4b99498fa61a41ea831d
      https://github.com/siemens/jailhouse/commit/92db71f257fabd3c08fa4b99498fa61a41ea831d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-04 (Tue, 04 Feb 2020)

  Changed paths:
    M VERSION

  Log Message:
  -----------
  Bump version number

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/213747-92db71%40github.com.
