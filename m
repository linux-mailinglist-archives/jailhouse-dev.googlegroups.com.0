Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBZGH57TAKGQEUPMK62Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF861EB93
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 12:03:17 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id t141sf407601wmt.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 03:03:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557914596; cv=pass;
        d=google.com; s=arc-20160816;
        b=vyH+1ti1Wca8lzF1YCBO7oyGVb7BjLAs7PkcQSFy9J19MebDIaqCgQ695364P/6/nP
         SsmHI/ZecM96+sqteJm4Px74YTpDkg8TKJ4k5/CbpCSP78I98ymfEQxjcNMDSpTKRxxf
         bQhWyFqRJGhWrP+ke1mhAHf1a4d273U+CM6/GgErE1XDEekmCI4qBvM/4kfHNcOR6U1r
         agPJj0/W5DGVHd6y+ruVeXGq+fqjoFcvVKZX2bzCVjXlQRe6+qpqDMp85NaQBNF5Q4cn
         gckrnU3OJzC9oMCyPRDA0dEPYNO745XGBfS7whM+G/cWZIOo3j6CfcZXOBum12E47L5T
         CG3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature;
        bh=vs5WWRV9A1E+dyogPv9Rc/ZcRw3O09DlkiYoRTMFQbI=;
        b=xcApUFlCYdbWqZfqENPA3Ve9JQxMsQe3YkIhJKiKmQajXnIxU98O1Tmf4P1YluBdAn
         /ebgU0fEKVh8XwbwcEh/RDSTMHcTbA0FSZyvFzZatY9mYx7by0UTg2HoYjitB7Ps9VRB
         fCo7baQFaYo+v5Hf3GqH3m2eMGlmHYj4jU9BBkHjsANJxnbBNaif8QtSu15nVdR8kUDj
         i5nf1bNTeR5R1KeEaOb2uJc2eUNbjBz5hyZlkmuWWvlyRYNQnKlh1CDzGj7bng0B/ukz
         p1eglgeTlP42W1k7aN361JuwiallcgkUPONrrWHgV/6cvfuS2VYiGFcqNMWSHZSZqFH1
         mjGw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="Yi7E/3QW";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vs5WWRV9A1E+dyogPv9Rc/ZcRw3O09DlkiYoRTMFQbI=;
        b=kWht3z8lve5zX5yP+Rgtqu8grgS/kYt5Sfukxw4J/L/dX4nrZaDiXODnt2a6td8Hxw
         8peGqnjVrVc64l+ZkX3jJz5pk+ig71qKIchtNQoc27PhsxbkjWm2nexFGAt4pZqRwDZ2
         SNAFOW5iliTxsMqCQdMPPCjnqBwVan9OhcuTT1Av8xP+sgmwjIK+OoFcF1/g7ChpdhL8
         xK/ljpFn5ifZriTMM8W7YnxJV3inQjINXInKZb8/syJi+0M/EDDdaS3080J6qquCghVF
         MekLQgQYxYfKP03y5osW03vJZ1kiQ48opOXf9Y3Hk55nu7LWaZJAcNxy2TuvKy/7vL1y
         xbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vs5WWRV9A1E+dyogPv9Rc/ZcRw3O09DlkiYoRTMFQbI=;
        b=dL1B8MXzU5oixwdhonIcygeCZNPan/SpHFGdmoguxshjXNg3aRWWLOGMC+o4OangWT
         dQiECDzK/WtDlrwhGDzoQB6002239dx31O79yENGHZcSNZe9EQZO4OfwONCXQWpQMrRD
         K2MJ5VuPnI+Wb3C2CvBBuDuAcBI1v0v3WUUB33bw34lxTQZp691i7mKKbzTfei/6qJEm
         xBdIKjlDX3jttf9sLfb4N0j6q/D3H3A2pTlNwylz5M4fYA0tiXy+WuOsDCREHLZeRXaH
         o2uGE+L0xL/12Cc1G/zmSIyHEUqtJP0aiwHmGMi3kbiOJYOQSB+Mz4fOj6SMHq+hcsfE
         VpHw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXWjjjPD9HymYejwhZcn2JHS3fPZCZ05GSqeTlzD/0EjFRTs05z
	u1qmLSPeK03vo78Qyv964CI=
X-Google-Smtp-Source: APXvYqw1xMrWyEJljUiCrX7gAMc+kXHYOtXiMuVegSsz4HS//lkuvvdtXBedjjbekDxfru8Mg5OykA==
X-Received: by 2002:a1c:c144:: with SMTP id r65mr17565553wmf.24.1557914596880;
        Wed, 15 May 2019 03:03:16 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:f507:: with SMTP id t7ls628205wmh.4.gmail; Wed, 15 May
 2019 03:03:16 -0700 (PDT)
X-Received: by 2002:a1c:f616:: with SMTP id w22mr21374560wmc.28.1557914596418;
        Wed, 15 May 2019 03:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557914596; cv=none;
        d=google.com; s=arc-20160816;
        b=FH3gji6+iiS3VHVqwJ6voiFBDldJeNDqFMKQ2ECkec7LarSN5t27DaO7s/qhy/iAKW
         UZC8oEStBdAAoVhV24I4E4twn7HXpWuwiPWJ+IJSrkf6rZ0m8vhdPulV3MNoFsBg7K1O
         mvcH1ersltAT3Wy7zP+fO62Ju6ovYbA09IybyNY5xn1qPRSExLjSjFbV2adwJ/WbUjLg
         n/IWZeaE2pTST0yQ3BlPj/Dbct6KjhegFhBy14OCb7+P1I4v7XaM3sLqe70ywQ01Z23t
         yqAaOZeoQacN+CWoTGZbHtv8pEzlxjVXldHwb707zq4Zo2uHnpMJNBD3N8NggyDe3agy
         H/qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=g6vfduqq1/lZPaRqpw4osATG4q6141nSfNk061YadO8=;
        b=lbrM1XC8vjw5LOMJgBX2DGStDOR7Nsou39zhcgdL7Di+9Sak/KPwDQhiOFfhjQ57we
         UO139v3NQqN4YN6TtjxOqbLzhKFaIA7JblI7TouVzOBKNry/apVz2Dvlm3aDL3pDiaui
         E5gz7ZD/2sBiArM59Rfjjb++sSYaYd0SnM5LiBvNi6Vu1U6LAmDtU8q9bu5slN87TosV
         2ssU6F9CyF83oEEbn3+dx+m/iAvuXXrv5o11Vf4zUdblZ9Z4B5MCY693Lwr1eRlrz60P
         bP3B4JPxis/5vpJpiYSlC88DXvHgjEqyMqYSF8Rs1t4xg8Gw+9kvlMyk/Qo+A3V7iG3R
         2V3A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="Yi7E/3QW";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id v1si125363wrw.5.2019.05.15.03.03.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 03:03:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.54.22]) by smtp.web.de
 (mrweb002 [213.165.67.108]) with ESMTPSA (Nemesis) id
 0MejX6-1h2bm73UnQ-00OGgu; Wed, 15 May 2019 12:03:15 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 0/5] inmates: x86: Add exception handling and refactor interrupt path
Date: Wed, 15 May 2019 12:02:26 +0200
Message-Id: <cover.1557914551.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
X-Provags-ID: V03:K1:bihP6LQNXZh7W4QLKYSwj4PK5exHKf5jF3qg30gyclJSq5UfGo6
 84w6CdGgUw5AGSAktIhBMKMNwMaE5EzH7hfNXFrDvxCS5VNW8uBTlKeFjMtj7Tt/GFffHei
 xAnIZgUR9Dn3Ys1AKRSobsxO5zlyoAXsGx42x59TPjeMU/ExvglpdrbdTNA7fOhN2PWUsJg
 AwnQg3y4+PJ+myJjZhJrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Woqk0NlwAFo=:d6rErQgQhCEcNB/dTu2CCi
 USB2GjoVJb3JCzFhw4M8AuSzPFGd5w05gEbIbQ52t9UTxc6G87oOqv6P/TaqRYAIZPbrEsNqY
 3eAPHZds8OKzuYJ7KuA7shQn3Wnb7wOypC1U4wFxpwQky/4O8AILbAt+wTTxTC89vtJjJ4dDR
 a+wwnPSAqM5HXfmTRFpzlkf4vUePQw/iPazShcXrJCG+LQCE9urvtZT55nw4JXsjiYuPyeNvf
 dINrfJx/MUT7/WikzY/J4LuhuwxkFhHumoewYsv0E/IlQ1HbXTtYWIJGtvwUC3Dc/3eK4BYMP
 /fq3DToZzQfMKCk1MxsrJoo5gX5834POI0K5c93L+K75qTdvzeXfn0tmPlxqOY17AMqpQ21UT
 I2fqDhrKvMAHin+bi912iod0zUiyTEAXI0eopkRsxiYHvbCkCM0Y/RF01zHm+XPFguJV95Haq
 frECNPyyjKA/YPPdRZjOyOfTWqkZxKOjt/7qua5ciJJRR4x0FtC8i/328F60ZfTxmQdrbtd+K
 VlCJxtVI04RNImmK7+KpBqvana8dcsbQyiyyvV3oSzJ1vpenpc4lwusdt9AyPQe+PFd+fZGZr
 JjIQRMCWcGq07j2wbj9yYjJVufkl8BM3CiyDaZotLhLak+b3Jjci4yjQ7jK39/m/TOS8p8do9
 1NlEzgzollDnGq/h94yVCRf3DtXyU2EhwSeAjin/7UhDV1L2h5HL5c3qYEluzWkvG+lxfkP/p
 50RBGkqqIaFj2P5Dvc3BwpYzK9/eKqctKVogGpoH2+Vs1UA5dF0u2dcyr7z+OYcjC9unPDjZ3
 3GUNaCc8moWpvRdyeMvjqU55pAPe/kZ+at1gyTzbxKhfImosJFTEn89rx/eKm6NfAM6sfPsgG
 7gQZ2OScOcZYnF/Y3Kc6GvdjKIMWfSqorv5f+c5XY93AGzbPl43YNYE0+cZfjN
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="Yi7E/3QW";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
Content-Type: text/plain; charset="UTF-8"
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

See patches for details. May conflict with your SSE work, Ralf.

Jan


CC: Jan Kiszka <jan.kiszka@siemens.com>

Jan Kiszka (5):
  configs: x86: Make Comm Region writable in all configs
  inmates: x86: Register IDT during setup
  inmates: x86: Refactor interrupt handler
  inmates: x86: Add 32-bit interrupt support
  inmates: x86: Catch and report exceptions

 configs/x86/e1000-demo.c         |   3 +-
 configs/x86/ioapic-demo.c        |   3 +-
 configs/x86/ivshmem-demo.c       |   3 +-
 configs/x86/linux-x86-demo.c     |   3 +-
 configs/x86/pci-demo.c           |   3 +-
 configs/x86/smp-demo.c           |   3 +-
 configs/x86/tiny-demo.c          |   3 +-
 inmates/lib/x86/Makefile         |   4 +-
 inmates/lib/x86/excp.c           | 165 +++++++++++++++++++++++++++++++++++++++
 inmates/lib/x86/include/inmate.h |   6 ++
 inmates/lib/x86/int.c            |  97 ++++++++++++-----------
 inmates/lib/x86/setup.c          |  12 +++
 12 files changed, 250 insertions(+), 55 deletions(-)
 create mode 100644 inmates/lib/x86/excp.c

--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1557914551.git.jan.kiszka%40web.de.
For more options, visit https://groups.google.com/d/optout.
