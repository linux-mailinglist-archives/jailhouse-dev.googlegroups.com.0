Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBIPQ5HYQKGQE73IA42A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33e.google.com (mail-ot1-x33e.google.com [IPv6:2607:f8b0:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id DF091152761
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Feb 2020 09:09:06 +0100 (CET)
Received: by mail-ot1-x33e.google.com with SMTP id d16sf803293otp.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Feb 2020 00:09:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580890145; cv=pass;
        d=google.com; s=arc-20160816;
        b=D08QpAnzW5t8GG8+0WqPs1fYMEgqdgfE76OLynD1w+im7COoIDJpRPimYfAJY/nVpl
         efI/v2niQp7cj2jRXxHnbjxL/TxDq0ws8k1F16hCx8Ewjs2mrP/U7MrxfhpR6LjTONdk
         ds0TDKTvfPsy+Qkd49yasvcK/TDz9C2iyssh0WKVO3q5qcJqpMSCUSH0kXTzyJI9Lxbi
         s5FBUZgbJdDRQ1rm6h3W5ZTcMCEw3KQU7uV8JVN0m3VGssG4gH1L6QUf1KtzgGSjNOc6
         WIB5gKnAYUOcVnO1ojDn8YVqLEa4GGKP3K7CD70jg9MqyYir1O08eLnhSt8+cEDNVA0b
         QUZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=VRUvU3UTjm8ktC4TDbP3D0IdbVNq56Eh0+igrFoqhnU=;
        b=Pp+p4YLoZ6w54DR4blN685CfjeAyy2h70IFSHAvytsxPbtvrOn/1XaKzWzF982iq4h
         3vGeRh7MY7SF9Sfby8J3KfcyRAP4U+5ER45xUXLq24mY4r4cIxADRMO6oAIej/4QuZzd
         yz0LTIUAb9PLPs8lP47nbo0rCBh5d0n5dTc9TGHyTxMoZD6cJk6+/DOTJCyigxpKwFBg
         zfeXtxe9MCLjuF/xBWNDSv2QSsILn/lLkoeXgEbC0dOy9ghTXFi7H6tJRBaFEHnQISzF
         9Yj4V+ZiZhXycwOP3TIPHyVbVsB636/qiiosJSzeCHt9PM1HrKFWHHy9ZCnSPKGuCwrx
         OoAw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="azfVG/wC";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VRUvU3UTjm8ktC4TDbP3D0IdbVNq56Eh0+igrFoqhnU=;
        b=m0XxL8huaUA9dx1zQ7GncxKRK7bdisw8Y+d0SYhWEx6/y1R9j51rOLP03hmqjjWmWK
         au6q/5aj/JBtw7bgb9So14tFgNi3gnSYmovIfVY5O1RkAb89nLIaUxpdvQhdujtBardE
         914SHNoCmWx7vWfZi8adCntPp5SZccAZ7kCzyHU/w2ZGfXfVecJHcoGE4z0EVMe/GLzi
         NULqY5Jg5OhopkAP7evKMeeGPeXxI27bhOC1PXt6SecZL7RMds0pXMGuryrR/0vKjNfH
         MJEEakuIDybxuZV/nXNH3ik8MdQPIP0Wo2IKZunzQ5Ikvdl+KVnT3vlO0FD4MAGRvloP
         hKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VRUvU3UTjm8ktC4TDbP3D0IdbVNq56Eh0+igrFoqhnU=;
        b=o+GUv20yfGwNrE7nAWoTDGYMOmEnnfWEgB9D5ASLKEx7oyl6slKd+x5en312rMNV5Q
         OXLfcD1wNZgsKLc94KtLND7PZO9gDCJHPvuayeQjThJOQ3bchkCQRPdLpVqL6sVtpQMS
         39sLam0LuJtZ4B93kyqiqlmo8z2fPMWKuG1qogjqxqjLzpbBLHRcFOZZgGvFR6/jSAk+
         3gz+bF3yzz77d1tlP48vE2KW6kwB+lp5f8wBTI7AnBe0w4QCX7jgT/5OCEwvsIheReoG
         XC2H1O58OO2XkveU6umNmKt9tUxQdz2a7K5C/M1h32YYxj+ecXW+3EhTkF0Tbb3E1GdK
         XLOQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXwFNJo4H5eLzeqW/Yr4VDMVy+rWQtDu3Uz+yMWMDbHMXqTt/e/
	Ls5+l21YayatgibJi4D3xZU=
X-Google-Smtp-Source: APXvYqwTdUeEWduWE4PLu6i3hsUEiqtRBfQRVs4wQDqHtBEsDBzQ1ePGv/vPfgBsVH32jLXV04qn/g==
X-Received: by 2002:a9d:3b09:: with SMTP id z9mr25239280otb.195.1580890145562;
        Wed, 05 Feb 2020 00:09:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:910:: with SMTP id w16ls355162oih.2.gmail; Wed, 05
 Feb 2020 00:09:05 -0800 (PST)
X-Received: by 2002:aca:3354:: with SMTP id z81mr2109197oiz.129.1580890144987;
        Wed, 05 Feb 2020 00:09:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580890144; cv=none;
        d=google.com; s=arc-20160816;
        b=Pt1Ua7PETMpd4j15w635Ahyj6i2eLgMPhjQ+XNdJfvSTduGPkEq3a3tAJjcIu5YFUr
         00I97rDOlNOfLu2Fr3DlqGM2xSQPX3p79K/2zGFr7+fjOa5qZXGu9ZkiRcnKhLVJ5ea4
         9mkAQmk3uZ2VOv4bDVaaUYnsuqvijimLiM0jGXW41qWtedX/rBvNK09abaNGr7gxXauM
         IVGTQaC9VJUendrypiDJcWfBgj5A56MVTzWg81hROhMBk3RfQyALUA9Niw4bAZG/uM3J
         aRjIHD/DuP50Ilyki9NP4uXgRGC/U3Z0Nnv3W3U64ZG569f4ftsm1ducS2mi1qxiWGBs
         Bm5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=qn5TqvXKyrvD6rXQZ7e3C7jaHYkbzF3byDtEzoQ1K6w=;
        b=s1IlqItxW2A5MQRygW5kn5JeMhWNJ2C0i64CmgWESRZyOK3kbRkK4FRnS/Y9/Onqxp
         NJgVHmXCZUCPQhSDkRK1NFrwef6S6YD8XEu33y/MKpa+iELvWf9HKb3EwaG2kHI+ljww
         bm7esQ8LC4F3VQvglc+jLXE8JIlxIpDOOP6R7Z34KrqpRLsiiXHZLnatap9pxOQ+0r15
         1RP9hRWckdLT5C0dFLKKRrZjBxFeMx+e5Ex2VCQwy4qUuNutoXTBKE7r5aerUr08BP+L
         /bLNXUC8/VnbpR7Ttcl0RXiPwTSzGp/lf/08sYZmhwkA7pgDJFxNsSRgeY1thEwdq+Hv
         l6ww==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="azfVG/wC";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-18.smtp.github.com (out-18.smtp.github.com. [192.30.252.201])
        by gmr-mx.google.com with ESMTPS id d6si920569oig.4.2020.02.05.00.09.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Feb 2020 00:09:04 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) client-ip=192.30.252.201;
Date: Wed, 05 Feb 2020 00:09:04 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/92db71-7e538d@github.com>
Subject: [siemens/jailhouse] 7e538d: configs: arm/arm64: Fix vPCI IRQ
 assignment of Lin...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="azfVG/wC";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
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
  Commit: 7e538dd94667a1426c4a694f8bd9c6071ac41b88
      https://github.com/siemens/jailhouse/commit/7e538dd94667a1426c4a694f8bd9c6071ac41b88
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-05 (Wed, 05 Feb 2020)

  Changed paths:
    M configs/arm/bananapi-linux-demo.c
    M configs/arm/jetson-tk1-linux-demo.c
    M configs/arm64/espressobin-linux-demo.c
    M configs/arm64/hikey-linux-demo.c
    M configs/arm64/jetson-tx1-linux-demo.c
    M configs/arm64/k3-am654-idk-linux-demo.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/macchiatobin-linux-demo.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/zynqmp-zcu102-linux-demo-2.c
    M configs/arm64/zynqmp-zcu102-linux-demo.c

  Log Message:
  -----------
  configs: arm/arm64: Fix vPCI IRQ assignment of Linux configs

By moving the ivshmem devices for virtual network one slot up, we also
changed their IRQs. Adjust the irqchip configs accordingly.

Fixes: 68b8ff84ae8d ("configs/arm/bananapi-linux-demo.c")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/92db71-7e538d%40github.com.
