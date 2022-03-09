Return-Path: <jailhouse-dev+bncBAABB2PSUGIQMGQEECLYDTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDCE4D2C97
	for <lists+jailhouse-dev@lfdr.de>; Wed,  9 Mar 2022 10:54:50 +0100 (CET)
Received: by mail-ej1-x637.google.com with SMTP id go11-20020a1709070d8b00b006cf0d933739sf1021371ejc.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 09 Mar 2022 01:54:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646819690; cv=pass;
        d=google.com; s=arc-20160816;
        b=ErjmEP1BOLz0awino2cGqPoMMd/wRAnRLi58VHDlU/eIGbuEJLC+xJ7EWmxIoUOu+x
         cYAtqAlVhaYNVM9NUMns8LwQ/bYei1XcJidzRhiAch+9/KUWmJWH0vtEnXC3XLC8bSWH
         896zXULWCH53S8pg+T4VN7EWKcnRXjiJ7hxJVpO+7D+3Y34NMSxpH4mViowxhcZHEWN/
         icrvPIWBZzqBZ+jTQ+WTmXbvlt+zYKbNkTkSf0i7Xj85M+tuVkBCk7OFmxMlctmPLCB7
         ng9EVXqefl0w8M3iTLjxw/0x4qIaOE7UqKMIiouQWPt2P7hAzHLuncCgGxVjPU03NoO0
         AN4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:subject:from:to:content-language
         :mime-version:date:message-id:sender:dkim-signature;
        bh=CGne6gRZVGfObfpPM6HG9bzC7ApGWipHDceHBi+IIhs=;
        b=Pcd/Lmyh9qJE9jKIVeVulsB4tuisbqG3PnrQqfN8w/o800mQ9plBeL+6cZej9IReia
         iucRn+nYBXJ/C5tQVdLDegC4iIG9DDHLg1L2eExwrWFx+FrEQKWgiG07VW17Zb/0BX1p
         3JhewQxXWISPbiHexvfXx4gydSodxlIlcpe/3Lv2pA9KyVqVABmNeHM7fJsRmXeRGyEB
         gxk59lXBDtOuJih5aXQkQ0McoWTsFy4+kH/tudkABF50vwdhFlIOpW2RY1/E912glT3n
         zp/OHsQmJYrmmmvbugXuRFYfku8Y5CDM68Gfo06a1/zkKv9mReewRb7KyWlsqYvaq+Jc
         9SRA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=h0vCAcXM;
       dkim=neutral (no key) header.i=@linutronix.de header.s=2020e header.b=Lkofp2q1;
       spf=pass (google.com: domain of philip@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=philip@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:content-language:to:from
         :subject:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CGne6gRZVGfObfpPM6HG9bzC7ApGWipHDceHBi+IIhs=;
        b=KTqae9DKR9A7RQUWO0b34fecA0wHOEodKllJBPrET1xjFpSitF/9M1tc++KHjJNS26
         wtzncKcMuuOZAV0uhkBUZfbYzANEomSyp4fopLYoiPb1ZyUJe7Kw9sy6h+Zwwx06N1oy
         uPhbGVKfNytlt5JVTrYwx5bDnGVpr1W65bGmwjwRlN3keU5vP5xamBJFu8eT5wmOqZFx
         d9LdW+l/8TJyjqMKhK5UVNTlOUMCWCs1adrkX/78F8KMd8poqbO90LMJiAmMyC8IDUni
         SGyI91njAXtYvfgZXF6wEJ2AUwI3qrwkJAT0uEHJzHDYFmM7erVE9Ze8yRNMxkS1QVAQ
         aTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version
         :content-language:to:from:subject:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CGne6gRZVGfObfpPM6HG9bzC7ApGWipHDceHBi+IIhs=;
        b=SiQpj7BPzOP4Z7A3b3LLpjVNAl5Vnn5xshv4nejqN0hZnrkh4SyaDxyoiOsV/UCTo7
         mRj/P3oVp9jHPTLhlm9HV9lCuyEqrO43eGy9YQmf7vGjkY//a13yDUlO90PsZ/7jT6Oa
         L2LW/mI675nGEODdEoXWpQMShnzTd5opZHC/Sbk5nb/+y/dhew6puCH2Lz141SvH/Ca3
         YLFKMJ/28euKdW570OSgFfI0VtJP3MRndaCHHHQIK8Js5SdkVNmjmtH8v+1fEgMlivgC
         gc87PIXvEjFhXdF/CtCJSunTcIdjTTNlO76LlmcaF/YlvyU+otdPkUAiWeTodY1lvUpA
         cKPQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532gnR5Gu4NlzmW9L1tWMIu13MSti4vFKOVZIcGbPnBmWOxbUThp
	EffERjIQXh/f7cLXKu/b21U=
X-Google-Smtp-Source: ABdhPJxiDur/rRllveMvzF78W4gExjqLzXjA8iRvj2sy6cNxST1L8lUzuLb6ouVjIRY6SQ/4oZF+bA==
X-Received: by 2002:a17:907:9621:b0:6d7:355d:6da5 with SMTP id gb33-20020a170907962100b006d7355d6da5mr17166521ejc.195.1646819690429;
        Wed, 09 Mar 2022 01:54:50 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:202f:b0:416:607e:7873 with SMTP id
 ay15-20020a056402202f00b00416607e7873ls1218755edb.0.gmail; Wed, 09 Mar 2022
 01:54:49 -0800 (PST)
X-Received: by 2002:a05:6402:1941:b0:413:2b80:b245 with SMTP id f1-20020a056402194100b004132b80b245mr20535259edz.252.1646819689121;
        Wed, 09 Mar 2022 01:54:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646819689; cv=none;
        d=google.com; s=arc-20160816;
        b=l97eTlyOfecTLb8++PtaqCZ5ASSt0ynyDmWtX4tpojP90mJkLr7BoPRRLZAoZn/H/9
         QWQSfuPgRV4y3cRNdcdMyAyG0v+izQmJJ/3B9lA9OiBhmq9OCqdTXytsDHKX34Ch8VpZ
         jtw61A+nZGiRoDh4UE83FL5mA37Zj7MI3A5ApwcwfMNRZQZVwsavXFS2ZZYk4VUd+6D1
         f1RrUOW8i7jKMiDY/gWXazAjjNv6PFDQHKZbRZ4qhGIZxB/loQyPJIU0yaSbREfUCl0n
         ZEcSgQvn8IXjKB6W6qSTFkWHo0Wy0mCq/5OXTG2OOBVzuk3NnO4qt5mb3SDEX0yAX0AG
         OYeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:subject:from:to:content-language
         :mime-version:date:dkim-signature:dkim-signature:message-id;
        bh=1MnNgb826s0ZSJ5qTeWScNtkGckR16uJK49sm7z4B0k=;
        b=wJq1kPIDJ8THUUuZY8a0wndwwGf4G7jsGH4BMJ3MXln8VOVTdvMvE6EJjQWKofzfI7
         b7U+AXVebNiDrDnFwBI1uSxLtMgT+cpzjUXcsd1yR2hcDzXnOoV16Dk0hYY4o0/KFsWh
         VithUrM7baWwBkqIjYRGl1eWuip0Kf2VaI4RGvoocXsDZls+uiUHcDu6hTS1n5/XyEGz
         0Lb4gnZi8ykOys4mxi43cMZfIMkjJB26mtcj41OH8wh8GSVmviqtIX+x/+yx+h7v6bZb
         c1e1N0X7d5kPez+5dWvEMS1H/e2h7A+1chzkQRppOO23IWqTH0zopLnwKJrBt2hWxca9
         bT8w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=h0vCAcXM;
       dkim=neutral (no key) header.i=@linutronix.de header.s=2020e header.b=Lkofp2q1;
       spf=pass (google.com: domain of philip@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=philip@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
Received: from galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id ay11-20020a056402202b00b004167027061asi82786edb.2.2022.03.09.01.54.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 01:54:49 -0800 (PST)
Received-SPF: pass (google.com: domain of philip@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
Message-ID: <1f639549-e27a-e369-b60b-33e444cb0017@linutronix.de>
Date: Wed, 9 Mar 2022 10:54:47 +0100
MIME-Version: 1.0
Content-Language: en-US
To: jailhouse-dev@googlegroups.com
From: Philip Molloy <philip@linutronix.de>
Subject: Porting Jailhouse to the STM32MP157
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: philip@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linutronix.de header.s=2020 header.b=h0vCAcXM;       dkim=neutral
 (no key) header.i=@linutronix.de header.s=2020e header.b=Lkofp2q1;
       spf=pass (google.com: domain of philip@linutronix.de designates
 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=philip@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
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

Good morning,

I'm porting Jailhouse to a board with a STM32MP157 and have a few random
questions.

Are folks still using the #jailhouse channel on Freenode?[1] I joined
briefly and didn't see anyone. It seems like most projects have moved to
LiberaChat, but I didn't see anyone there either. I also checked OFTC.

It is a bit confusing what patches need to be applied to the kernel. I
initially saw the patch embedded in the CI script, which I applied to my
kernel, but then came across queues/jailhouse in git.kiszka.org and
applied that instead.

It might be nice to update to README to clarify what should be applied.
And perhaps modify the CI so that it uses queues/jailhouse or tags based
on it. I'd be happy to make those changes.

I believe one important difference between queues/jailhouse and the
embedded patch is that queues/jailhouse doesn't seem to revert
15ff9a39cd5ebabdf704634ea58806f2d12bbc39. For more information on the
impact see 6e43fb65 on my development branch.[2]

Feel free to take a look at my progress on Gitlab.[3] Note that I still
have a bunch of TODOs littered around, but feedback is always welcome.

Also, if anyone from emtrion is active here, I noticed the emsBC-Argon
also uses a STM32MP157 and I'd be happy collaborate.[4]

Best,
Philip

[1]: https://github.com/siemens/jailhouse/blob/master/README.md?plain=1#L47
[2]:
https://gitlab.com/pamolloy/jailhouse/-/commit/6e43fb65b01a7a622cd6c2195a3bcf763bcf84f4
[3]: https://gitlab.com/pamolloy/jailhouse/-/commits/stm32mp157
[4]:
https://www.emtrion.de/en/products/emsbc-argon-single-board-computer.html

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1f639549-e27a-e369-b60b-33e444cb0017%40linutronix.de.
