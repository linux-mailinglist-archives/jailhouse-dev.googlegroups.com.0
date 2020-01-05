Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBTOKZDYAKGQE3VVTSJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3a.google.com (mail-yb1-xb3a.google.com [IPv6:2607:f8b0:4864:20::b3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C8613095E
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 Jan 2020 19:05:03 +0100 (CET)
Received: by mail-yb1-xb3a.google.com with SMTP id x3sf151802ybm.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 Jan 2020 10:05:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578247502; cv=pass;
        d=google.com; s=arc-20160816;
        b=ef+2DzIZXoKgXlYxWTVWsHCNCRg4dNMunmQJ4Xa+J9q8dLaDxFU8szGMLinp0fYNBu
         V5e5x/lj2BfRzcDwlN8otEDcPzaqwfyujQZOx98EV9D4gjOE8ElSZqdGMSnQvSxDJS4l
         JWkW8cOX6psXV4GuQoatoS/Aa6S6QomlHJCVUgJYIxCRjhGS99My/Jd58mGG9rov2xIU
         PB1bGD8GBqGGUhlUr03oHbi5McQ/WwKzNGMjNYsbC/R8ylrcbC6hNVnDMGjISl/M3rNT
         zVuqtCbbIOYhWerAVVfqQcIbnfUF/RLvhdlwEiIOMEOBzr95lsebbVgHxDc+a1E4X+ZU
         rRfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=Haky/RuwdzUd7uJA6pZIFLuaBp44b55S+JQYd2CdJ0g=;
        b=K6TSGav+gsXMqGBReOhcWpIjBWzGLxjzDZ/RMMMG5NDddY8hOx5MBU/PViMlA8WSf1
         mGkAHkAqm/v621v2LVZJSCxv68EXX3aBZqYypZztfyNmP4xHbuz38IG+esz0h0mdgLNJ
         2ICQeC2I6EBVuA5y11YYz+Q7Q8RImQEOGj2Y47i7jc2PTjJEM1Tpitc23Bfg451Tzxzy
         nt7O8iu9VXh9YxP95kwVDr/+2JCmIWhWKD71IAChu6vz+kQRLJHItbz2leFjE0bSIi8p
         YHqet+oLnbEbMNkaWyXT1UzAo6lZ6TKhwED9lUtCdnofsZIJhlaUmGINataNHQCfdHbB
         3Q0A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=X76DW0v8;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Haky/RuwdzUd7uJA6pZIFLuaBp44b55S+JQYd2CdJ0g=;
        b=pNGm7g4wyLWJ43Yaprbk6IFCMeed2x8UjxgtJY3nnrVc4GTlt6dFA2ubJQHpVom9aJ
         Qj74tIDB1445pRotIc0KMCT0D5EeLnHu8D+CMEjU8OY1TITLst9vvT+IqaIFbAZO1l2s
         tA8ujoGw3pdXEN9VlYEUM7SF8PplJtQoHC8tmjcdw9veU3sYZwQNNGEI1vxe38foYUSp
         9sr4tFbzZz33wIwLAC/SSLNXIEFJ/1Y5R6BGo/Do6Lde1oiE8efZlq9mheUI0cK/WbWX
         /4TIJ4bNaHD9KDXNOTIzAHOZ61SUFuEA3ID9F12evnmaqmdslFeIdK1bclPueIJe6nj8
         ibjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Haky/RuwdzUd7uJA6pZIFLuaBp44b55S+JQYd2CdJ0g=;
        b=MxkVFIP0jAVv1EhW/YkwF1vxeQiyDmbZzlZDe1fAtUiXJPBgRF//JKSvJ2SrlKsIte
         zDwNCj77vP3VHrupu5OnEobh3YXVwfN2EcS4YpzjVhBrvGFqMf6jw1VpkL0GRYFne+yI
         UUb7i9DCgbQkQIuIzTGAh10H5oqFsQo2+SumJBNmAYB/qtvz5/7NbjtHj8qneuYLqV6p
         qC4ClBK9c+pGAB7B/C+O8KilClelmeTu1EY5zOXLyBGbS95VAL28RZOAVts/v9olBgON
         jrfyv6FC5Y/RBMrVWvB2eb6nWVx1ZHQ5uWYaaKcCJ4pYeSpw07AO2stUv8gMSTHS5dSd
         RKrA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWi7We4FZ4mdzfCBgBUKquY2clqn0QLYpfyuK4UQfxbG6C1cVC/
	1o3AKYX+eqHkKWziE0asD7g=
X-Google-Smtp-Source: APXvYqxLu5PFzjq0J2UOLNtcRIce3wHA4Bi9W9puozzEpxpMTPHfL6rT0kSis6r1xl+1ymjh+eb2sQ==
X-Received: by 2002:a0d:c5c2:: with SMTP id h185mr71954152ywd.287.1578247502114;
        Sun, 05 Jan 2020 10:05:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:2e94:: with SMTP id u142ls3484364ywu.11.gmail; Sun, 05
 Jan 2020 10:05:01 -0800 (PST)
X-Received: by 2002:a81:4308:: with SMTP id q8mr77197884ywa.9.1578247501425;
        Sun, 05 Jan 2020 10:05:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578247501; cv=none;
        d=google.com; s=arc-20160816;
        b=TxGDD4qE2+O2Aa4ozgThmfMLjpdXtiwUfOS5OA38/o+ZTVtVGRdJjtuYXjlo2COcwh
         vVeE1fqbCPbrprrrWZZMSbtGy9lPMeSJI4+i1N21FvMlH0+hnhcKZW55+XkdvmXTVWtz
         1R8azG5ph6td6AmUyCIxHYXqtgeaV7XTXej3uzBOeIt3PyrPFtMhp7rsY6XdXNkMA8YN
         v1kaHa7L/WatD6FV2lYjkTsHJ9D8fF4RxdizmeBANVKeneRcRjRAlDs2pbSR8W0XSzZX
         6goPMKY8dkGdh7mgVIUoyOEK1BA/rXxWb3/4M+gYAuUk0vWHMYUosYcc/74q4Kzu3lTI
         kvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=Ula2+F7iB3X6bR0gmeuKboIZjhyB/6ls13+SIn6Zp/o=;
        b=liv/tnThpaOqPv3yiKG/bs9U34YQzaHTs55v648LdLWzTuNVnB1hhMWTR0gA2YkdV4
         frPFeeaftq5vHwzAlmbguEy/kwIlsYH9qd3Zp7G7XvTOENII9BLdBrNPCZnGLES578n8
         EuTOosfKTH5+OjosGq4uOB/62RYbTHqcxfdP0zK3akax18T/x1nVeGMZk9ueAlQSGQmN
         UcAqXhQG4untW2so7hOYuvpBMF8CXhDut02NSYd9uHiDJd2zy3klbMDWG+UpLTLM3tOV
         v2qDXfHEn7x/O8QfUuOwKSH+tUxTmbq62RAH3ANQEQ+c7qT3lzMoju47eCQ7pU8PpmFF
         mhFg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=X76DW0v8;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-23.smtp.github.com (out-23.smtp.github.com. [192.30.252.206])
        by gmr-mx.google.com with ESMTPS id y3si1384487ybg.3.2020.01.05.10.05.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 Jan 2020 10:05:01 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) client-ip=192.30.252.206;
Received: from github-lowworker-edec459.ac4-iad.github.net (github-lowworker-edec459.ac4-iad.github.net [10.52.18.32])
	by smtp.github.com (Postfix) with ESMTP id 30DD5660929
	for <jailhouse-dev@googlegroups.com>; Sun,  5 Jan 2020 10:05:01 -0800 (PST)
Date: Sun, 05 Jan 2020 10:05:01 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/383f33-95c27c@github.com>
Subject: [siemens/jailhouse] 94ee32: configs: arm64: Add ivshmem-demo support
 for qemu-...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=X76DW0v8;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.206 as
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
  Commit: 94ee320b9457cb88314206a0436999badb1ec235
      https://github.com/siemens/jailhouse/commit/94ee320b9457cb88314206a0436999badb1ec235
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-05 (Sun, 05 Jan 2020)

  Changed paths:
    M configs/arm64/qemu-arm64-inmate-demo.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c

  Log Message:
  -----------
  configs: arm64: Add ivshmem-demo support for qemu-arm64

Enhance the root cell config as well as gic-demo and linux-demo with a
3-peers ivshmem device so that ivshmem-demo can be used.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 95c27c2d963144f8547a68efc53cb03ff56f4c04
      https://github.com/siemens/jailhouse/commit/95c27c2d963144f8547a68efc53cb03ff56f4c04
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-05 (Sun, 05 Jan 2020)

  Changed paths:
    M configs/arm/orangepi0-inmate-demo.c
    M configs/arm/orangepi0-linux-demo.c
    M configs/arm/orangepi0.c

  Log Message:
  -----------
  configs: arm: Add ivshmem-demo support for orangepi0

Enhance the root cell config as well as gic-demo and linux-demo with a
3-peers ivshmem device so that ivshmem-demo can be used.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/383f338cb7fe...95c27c2d9631

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/383f33-95c27c%40github.com.
