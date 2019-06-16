Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBOW5THUAKGQE7RCZYLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43b.google.com (mail-pf1-x43b.google.com [IPv6:2607:f8b0:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id BF09A475F1
	for <lists+jailhouse-dev@lfdr.de>; Sun, 16 Jun 2019 18:30:51 +0200 (CEST)
Received: by mail-pf1-x43b.google.com with SMTP id 140sf5443547pfa.23
        for <lists+jailhouse-dev@lfdr.de>; Sun, 16 Jun 2019 09:30:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560702650; cv=pass;
        d=google.com; s=arc-20160816;
        b=BMXksNfWTqta8tJUUbPtK82TPpLholKnBGsSFEZ1epzRcmc3AYoleUcp1gXZnU+kHU
         wCA6X7/cILkYkdqCeGI17Mm/ksrPPfPM6UMzrHlZQPITc/H/VeBetVIJ7kyesJIfb0Rc
         KD6cM+33xF9mLoGHMpdsEbBMQNpZEM7OZ7bBgGwmI6XqLad+k5LjZVoDZcbG2MQ3s9fw
         C9vZj5IcRJIFBbHSbWmHXNGVewKd2v8OI0LgDjwNhnvnU7Sk9jIwppPFNB9m1nljhabh
         uZKwg4cTZRXeutslUJhcfwAZeAXt/878SjCzkYEkvYPw1DN+pHv6KqzhLRbQ/cXe+5Ot
         K0BQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=Lc9R6pllpM864EaxnBDYeBII81nYQzXq+uInqGn3iZ4=;
        b=owENqvny7dPmTLJUlJRp2uy3WjaE4KwtDNcnek6m8iABhcPtnHELJ864cRqyAazhTG
         aAtrD6zkVNE1i8X4Pc0hT3HpAR2lpov+9/geWwq+yfitykOYbJp0rtjwl+3pCIx4sN6I
         h+lO/dSCuHisycqbmShEnFtGTETRy0ZfYwKI9JjOlEHBWIb8QtuU42J0ZYJ1jmZWFHR3
         nco1x1XmKHIdu44Jn+jzPfWnwZJeux/YWxDzb2X2rH/ccPQmR7dHWP2a68q8+fycc5by
         PVmyAIWpohnznIdHYqxqt7HLM6jAHQAzX6WYXaurT48WFvsL2OJnmFq0H7B+Yb0WRlYy
         KrsA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Sqd+qi6D;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Lc9R6pllpM864EaxnBDYeBII81nYQzXq+uInqGn3iZ4=;
        b=cc6KK+acIp0RA8wZJ4U000I3Z1yMd63iOvSYup+lH9jHYI+ABDVerYHnI0U7ObuPUf
         ZsSMbAOGPM7GAJNZnZFvQugfiyh7WYLR5EejKjaLFKBBf2ymPlpLnRP/b+v+EaJmNPmJ
         uY8T3VnO9CS8BMtlVFwoZRwAey0AqF/KceZFZrZnVwIJEif7hG1CdQnrza3Qkj//xDou
         +ukYyG/zeAO1ceumihTymIkc/Be6O7qYUUaLsJ9l7o8qzwSbmILzK6h0Zn5KOoklpRAi
         11eLS8x80q7gLuB1tJmbEQmSCb9GdHkw3daDbVBCBaY/sZNoq8QKgLUGOMWpCpnk/vhU
         kouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Lc9R6pllpM864EaxnBDYeBII81nYQzXq+uInqGn3iZ4=;
        b=n32f0QbSigpud+vSlzimuRbdZRwsxlt9s7Z3i2EyU1iSrorgn622NR62pDn5tG6/G/
         6+8u8VKFzLdpDjW7W4vzh8c32rs92SiynN9eEhTHLsng3bDK2D9R5sgLLJw746AjVUuv
         YUiGYAqDwpvV5XZi5hthoonM2/EvLGZb48j9VNPJkZnTnn/sFNvyP5QYtw2NkVeY6ihI
         9ilbB7RH8dnkUIlPQpUUv5mNkbmTfHdPFmccBbYwb+tXOsmm9/IVaCIOB10+cZFhCWan
         okfmmpyGIDb0Nx/J1Xsqxm+RHof+S5hip+tXXmgI8ZjI3YTUWaHzQYpcQrTkWTFWQ0zq
         D3vA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUvU6I1rvsTdk5rM7AV3Fe18c9mCkArUfOdo3RdhQk82917M6pL
	G72RI+BH66UepOayZa3cwE8=
X-Google-Smtp-Source: APXvYqyrFbjq17sWH0t+0iM6agMW91wwiRwMUuQrLCEh/m40rBmMdo6tsyV54p95sfvpMt9XqZkj2g==
X-Received: by 2002:a63:81c2:: with SMTP id t185mr29259988pgd.257.1560702650211;
        Sun, 16 Jun 2019 09:30:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:6184:: with SMTP id v126ls1220216pfb.1.gmail; Sun, 16
 Jun 2019 09:30:49 -0700 (PDT)
X-Received: by 2002:a63:1243:: with SMTP id 3mr21228212pgs.235.1560702649656;
        Sun, 16 Jun 2019 09:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560702649; cv=none;
        d=google.com; s=arc-20160816;
        b=NNkEKHOiCRv42L4tuty9RJgGBZu1JaMRpb0juy80fSCvjop6WogiZX96vv7JkSUnHg
         nwL5guawoVh9yHKv+QkLmmME9RbAsBTF+7ZNkwWQUrc0ERwMQrSKAs5YmoSTmqweYFqT
         1VTBgDBK0Iqm5gyAMf4CvnoHX+vcqwDdUmKbE1rOOuDj6viSzIhkSRh2ju7GovVkgRHa
         JZ24KfhAadVuArb+fKP3W+Lt5NRR9abbPp8PuMWSaEKHFu29ncXw9qpONiP0005rXSAs
         gTSJKv8yc5ygzJY5Y4alDAaNSzYTkv2K3LyeaHy4lkT39SiQvVsSt0Az/DpPMKAvOf4p
         LpIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=jsS+hBQqRsBHc8cX1py5pgwfdSQZU6NDCym/ePtVXds=;
        b=PiLcfYEQUbMchojHbn57x5Rk0fKPjKrU9OxRRM32jJso2Tm8Yg2rQ/tFwrWNqOzsl0
         8XzpiW00LLXObu1hkB83UZxl9wELM4h+PvomyXtoYmdwyUAgTJ46lYFGSJ+IhRrx84sA
         iIkmG42C2Erl3342xus0nV/kWqhM+YsDhIIPOxtQmmvtmHg//Qq/AgoCTOBNTAVF7jJw
         y6zihysa0Qs6QySgNdf54dQQ+fWy8lj0jmbGG3RMQp6xqrXpTd8G6maSrqigX61kfp2Z
         /0/ibk1F3jVrLcNgveZW22BmlQocDDV5eIkm6MnavrCcbKRFmrwEjS2aDZ+Tf6a710hc
         reag==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Sqd+qi6D;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-9.smtp.github.com (out-9.smtp.github.com. [192.30.254.192])
        by gmr-mx.google.com with ESMTPS id 69si420872pgc.3.2019.06.16.09.30.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Jun 2019 09:30:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.192 as permitted sender) client-ip=192.30.254.192;
Date: Sun, 16 Jun 2019 09:30:49 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/77c96d-4abf1c@github.com>
Subject: [siemens/jailhouse] 5cf4cb: x86: Avoid duplicate arch_cpu_restore()
 on failing...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Sqd+qi6D;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.192 as
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
  Commit: 5cf4cbf1dbc36afb026d10b6ee5e54d53968140d
      https://github.com/siemens/jailhouse/commit/5cf4cbf1dbc36afb026d10b6ee5e54d53968140d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-16 (Sun, 16 Jun 2019)

  Changed paths:
    M hypervisor/arch/x86/setup.c

  Log Message:
  -----------
  x86: Avoid duplicate arch_cpu_restore() on failing arch_cpu_init()

entry() calls arch_cpu_restore() when something went wrong. Calling it
twice may have been harmless in the past, but now it hangs. And it's
pointless anyway.

Looks like this was wrong since day 1.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4abf1cb9c80151a882f0086933a459ed83a87da2
      https://github.com/siemens/jailhouse/commit/4abf1cb9c80151a882f0086933a459ed83a87da2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-16 (Sun, 16 Jun 2019)

  Changed paths:
    M scripts/header_check

  Log Message:
  -----------
  scripts: Fix header_check

jailhouse/console.h also requires types.h.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/77c96d4cd602...4abf1cb9c801

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/77c96d-4abf1c%40github.com.
For more options, visit https://groups.google.com/d/optout.
