Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBZ7B7LWQKGQET2GS5PA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 11825ED2F4
	for <lists+jailhouse-dev@lfdr.de>; Sun,  3 Nov 2019 11:50:16 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id u2sf2502252wrm.7
        for <lists+jailhouse-dev@lfdr.de>; Sun, 03 Nov 2019 02:50:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1572778215; cv=pass;
        d=google.com; s=arc-20160816;
        b=H6NgrYg66nt9UHjBX4rJN/nJImgY3ltpPRaMEixBMOnpNM4wNVZUc9D1CQvAWSxjAv
         80AG6CYmzt5n88Um6Kph2WRumI4kBVIGFFPse3PrNXClsNb0aUjle7YqSfPM4Dd2oJkv
         iOAqLPmspm5W7lf5mJHfz7fKDGojSaW1SJ+fVhPlZmasmkv1+qS2H2HVlncFloE/IUZZ
         4PvKzgy4pglOs2CLVKx25fRJ921Ag91aWT34e7OkLeIbFVLJ8VFRE1fjXx9KAPF5aUVU
         CQGJE2D44QBDJBoPLtyhIY1xSZkNVubitKdPFA340yMBQIhCVEUQRVeI9rl+orC8hhIV
         ejZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=b2ewrqN3kRW1AKVl6kYNARfBpu64JDgZ4Zr8qKtN+4k=;
        b=LyYh6S0sZZp6M6f6B1xiTJtD9PkCh6sjV2bnOpuMhDl7oNsMl+/uo0Y0hHqK5nyGCO
         dZdJA5ZN53S/bb7RUqrcGedg2GgvXysDuaeSfcx5dUstgRQskICFZL9h6vXvfX0Q1xT+
         Uu24Vop6T5FHjSJ4Gj1O/EHFUOp0xqj661w3LoKlRXIk/8OGanITOuwj6vSbxhm8Nd5R
         aH4Du24ZzNRAR1I8IigxjEpv8lsTTqfdz8+PwvCwlwC+40VRbLtpjGU+3KU2JMwla9T+
         gux0PPc0BDzHHNMgzHs99zTRv338jZgDBqfcpCCetMKMEiC/HHSBdx9gCQKFHMy/5Wpx
         bXbQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=VcNbYgju;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=b2ewrqN3kRW1AKVl6kYNARfBpu64JDgZ4Zr8qKtN+4k=;
        b=JaLzDdh/q4ORh8sDfZ/wHySYCvfuu7sh1X4yGMjSXUik4wBXRAvbNI27k1I91nu89X
         KKEdrrKec0EHXUO+Wr8Ntab/ZKbZ6/geV2Blse37tIyyC0//th/W7i54pXDBIHNaEEGm
         Fs/ooZIK3EXip+8cbGT4AWsPHmRxEN+6tO29iZeIJ7r3m57iYa9xpHb78lhT931BqaPr
         BpysfksEposvl9m9ndTFsYzEZVdUrXGG/NX6Ns38R0y89fi9fKHAt3Z5LEp/ZQodsDgD
         ++6hBvUXE/QVqT+yGa8po6T6WQfwwH7ZEKWNQoGOWJNmuC7SsaMI0uM8QRQ4Vu4SnXMo
         wB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=b2ewrqN3kRW1AKVl6kYNARfBpu64JDgZ4Zr8qKtN+4k=;
        b=iI5sVW4gUJFStT+09rmCgguzjFg32xibW3VXIUQ2swAH0gnFggRiQZjprH2qgNAI2P
         PyiKPBVC2R9sHeRl5rAzE2en+bj0uiY0XaOAVKzNOzQx7BWEpPddVQ1oQ7b3QmDozMEq
         H2pExZ4w+w0L+Y4DqOdvMg7bKgDI40IKgnDF5ZPJUxPFeooPXUDUmRUGMBg7UKofuCbJ
         6RjXgjEC1rrU+2Nw+rQBAUUdOavWTi6I6FUcpM5CDBosSESsrPCj9OI/lfwCUqCwmH9n
         kkXLqSKrM+eBUFEuUUqPNr61mDoTpAewv7+Eeu9oKNfvY6bkdcahvYwDklVYFEkfHuR8
         LSPw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUkQKb/+5P8RyWj49fQJx9K0FNj73WsuknDi7UdCPqHL0AvbBQJ
	V5MScJeqR8mOsjADPyeLTWg=
X-Google-Smtp-Source: APXvYqx3iwdRMI15kyzFzpUi/xmT+EoFMhP5Yr2Gk7dt4repvugGQEb0AkmjYfkxbdlBI+Kid4tlGQ==
X-Received: by 2002:a1c:38c3:: with SMTP id f186mr18874129wma.58.1572778215679;
        Sun, 03 Nov 2019 02:50:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7406:: with SMTP id p6ls3109233wmc.2.gmail; Sun, 03 Nov
 2019 02:50:14 -0800 (PST)
X-Received: by 2002:a7b:c3d6:: with SMTP id t22mr9214357wmj.26.1572778214828;
        Sun, 03 Nov 2019 02:50:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572778214; cv=none;
        d=google.com; s=arc-20160816;
        b=YM/f8uAjsqK/auLjOcjDy6g9Dkb04F1syRtdGNwR7XiG+sLpqTgu1gZG5cjiYj1BXr
         ZNTJ5hVRyxINYXpOWf34QdwPG4no+ZPIZ5FyoNCPyqnEXcamJyFnS3d6lDzaVrnWuCpb
         V2xCqwaAFok/wonA78UDd+aU3acN1bm7Vz0TU5kCbPIXpewLO4K9RORzMuvwM4MFf45I
         hzpsPgJyrb19AOmpteIZYgUK1aSDU+cYbG9wIO5pEmsZ1Ce+3nO9fu5NOKKqMSEWPGem
         8cvMXI4s73HuI+o08zasta0Z7jxjYdchdIoulnvkZIIMpwAPcSJdxgtwcscPdBKQvIcC
         yc+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=6mQPjwOf+OcHFEkhT+hzAqvLvp2PBnwJLGj2+2RaqH4=;
        b=FPLDmYwRxxshYRqAQt9VbNh5fWvBs2hiNGd3gooOuh7sRGybGHyrjNgJyYkZWqfUVd
         VMhRnxzn7pglTty3tcUf3PKYoYfSNlFjh1iamn64aj/ZusIBOlL0203Kw5QwhQ5bsZtY
         /zf4ecQWjYk6sdUY+AtgTHJDs2fXGM4Cipzcreg4GwKzK0nVGhHiDHq6i6UBes5gr9Iw
         nSlXTZ556dWbknEAuqZ2WWBf3xzE5/Oa47oMabdpNlpzS0GG/WVIw0bAxLtfQ5VvTv6M
         1RvEjLSwqavtUs9Sp6c6OZBVzIWZ3L9FH9gH/n+lePBZWHHIVYl6Dlg+vdRJwkee9+RY
         RkAA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=VcNbYgju;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id c12si759577wrn.2.2019.11.03.02.50.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Nov 2019 02:50:14 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lz3FM-1hwIT81RMu-014BRS for
 <jailhouse-dev@googlegroups.com>; Sun, 03 Nov 2019 11:50:14 +0100
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] x86: Permit root cell to enable CR4.UMIP
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <04cfae41-e576-6a67-a798-a1fe1827fd32@web.de>
Date: Sun, 3 Nov 2019 11:50:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:lFaiHnBoWN2h3GIHUtxjEfYT5XOaXNP2duZ3z6af81/AkXDFZHa
 PAPZ9TKz1VdonecNodk4mBxIcsrE28ErGo9zq9YY43QqIRRzcIkoeNX/1LOAhmg4GZmZVuf
 7Th32Heo0JpOtAsTHPLhF2YBMWjcE4HiPBdfoxVRtz6z1lUPLdXfWja0n6uK/ICMTS1Zrpr
 jXVSPYre/YjHuAbZ4gLTw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZWP6bu4MvGc=:OT9jTJ7qNVTaK1EV8Ux3IO
 YbN9rb5/sWz4OgMnLdR5Fdj0Pen+K+IRNvpYGH2FxvADG0wWnHm+UdOCN0qCVQo9HEK9ExuNn
 QIhR6mRk/uz196/cP8xvmeiDls/AIk59LzozOtnlgjfh2NrTT21DYslW7+RAJ5KhCVPb99y4y
 CgZ3lckSAnjZu00wAEp5pO7t2gJl/OXyCQvwd0eCPXg5iLJHlvPwL+J3hjzD67fa7wvVHDC4o
 734oUuByu2G2+O5oFWuQFQ28k6vGgOGSFAT6Jv8lAu4gLcbsHjCIkLQC9qMHTMydc0Nwq3LNY
 FT44LYaB+lHhIuSQp1oIMb/bZ7uIjYLQQ39eHAhJybFfUmYKRsmkpA4le0I8rJh7W4GW1s/Vh
 571ezUcFbb7cW4c/bPT8CFy7WwzI1OUH/7pJKAwUKZ+WzpES1jbF7WuiWgj1XFI+1ICHDYdwQ
 4GQdS6O3Myg1fIRXqYl52mhlZfLaNGnykaJs1ZIJSVgMgUdBBESoYqMMaSIgt0YJcgtcXhDGH
 gm5wvrymYF34oYxyQW+NW5bbijKqZbKmNsK26c9iva0tLseEoNUVEUBUH3CStbtri3gLeNLiN
 a4dQmj767FKyCWZ2KCo5RPcfTBk6yaVdqucPb9aKHNSvqSb6QMH6TWa+Zp7gkpj4k9Oq2Apao
 rPFeNgQgfST6RYJz0htYl7yz4mMZbDdmRZswhdL5NG2POKtxQ1+P4eN3BdiiMmIEtI63L6sHe
 6I9YEEDJRn6G/bOSrnbSG/tph8sqgY28ECObZCgQ08OdwRLwz4d4tR3+VYYRSaLixFroq3QEm
 aKQKEwZTT5RzyVQp+wF6J0UnOg1ysIhEDr4sziu/OhCys/3kY/vPlGW24isKULGhLM6s/Yth/
 QP3DHjOM/qyFP9eQHz4RzZHY+SUu7+4ct41+j/8bfBfujCpi8oaHdxz40sUbqoWbH7ITrXsms
 brDZ4KEr/isdzUpQMOFBRcOD/1dAeaxDgQmDWgzHQL4npAs+E+dODqb8K57UUnjRCcaKc4b+N
 SXo4zgDFrwVtOBVRK63dQli9o4NjzGnZsoZr2I9SKMsblTy/u3qJZEF4BRTt1/jG69c8wnNsE
 0VOGEaDDtPoB1FwLgdhZH9offQoA+w7egrSllxzfzWK+tt1uKTdoJ0Sb63hV5i3Mp//EzRahk
 +xTtLia0dFodKKtl/OKs7jmSltN1XBic2Pd4OelHpKrwFWs0Gx6ZjLUq0bPnQ/h7/ndPlvju6
 sDrFqkyHLtRGol86VYK7A1CHwiBCpE7UU+rA7nQHcbM+HC55vsZPU4Sxrxfo=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=VcNbYgju;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This is safe from hypervisor perspective.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/arch/x86/include/asm/processor.h b/hypervisor/arch/x86/include/asm/processor.h
index d8111690..d22a60d7 100644
--- a/hypervisor/arch/x86/include/asm/processor.h
+++ b/hypervisor/arch/x86/include/asm/processor.h
@@ -66,7 +66,7 @@
 #define X86_CR4_VMXE					(1UL << 13)
 #define X86_CR4_OSXSAVE					(1UL << 18)
 #define X86_CR4_RESERVED				\
-	(BIT_MASK(31, 23) | (1UL << 19) | (1UL << 15) | BIT_MASK(12, 11))
+	(BIT_MASK(31, 23) | (1UL << 19) | (1UL << 15) | (1UL << 12))

 #define X86_XCR0_FP					0x00000001

--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/04cfae41-e576-6a67-a798-a1fe1827fd32%40web.de.
