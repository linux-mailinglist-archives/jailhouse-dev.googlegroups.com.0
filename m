Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBM4UU3UQKGQEBHNLRSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id AA14467907
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 09:37:24 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id e8sf5459668wrw.15
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 00:37:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563003444; cv=pass;
        d=google.com; s=arc-20160816;
        b=FUDF8SKG9IyqvmYJR7uFDOIbCxcsIXkH1L4R3ya0ToK4QPF3wFWycE1vJJAGP3dfl8
         JmR1n/90K6kuRgpL13Zr6gFDNVnKE53KtP7v6syZx17TYZi7abXMPOSc0VQ9J54yVX8F
         4w8HPSAzFip2ncJ/Y0ZhVXZovu0IYjhqdBkoV00e0upJ0aMI0Cj39awDQAr0ea8uz5Kx
         NPLOCBvEPZyrR6pWxFudnL0wlKa7ZDzJS2i14jQtD2aRFVrHyN2pSZw6O+TjkYvyP4BA
         DgkDTvYXAGjxKYVnUEGDEPlgvCXbHdFmBLlQ9s+aiwi4eNJ92feqDkvGS0USWw9aWHpb
         XL/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:to:sender:dkim-signature;
        bh=YJiveGr5aGoqlASPJJItVzOKCYXYwcyVVgoPzFitdR4=;
        b=A4qNn9CTNopVQIG5wzLXUzTrjDZmEBZbgKvd7YWQchjNjGEIkWjbmPLge6bzUY57Iy
         UxsJaredjrUrDKoCZRt7t4/lbdrL3y3ZzRCyiOBteAE+JEzjvGZxh5+bVJXIgeJTeaYy
         gIPTmnuTsAjMk0v97umlT993huiMCggKE5uQw75qQwFHB1P0ZTmMRoIQ/Zekn7D69hD/
         L1Lv3NgmGhHQNzE7yQglYcSbnj6u52GNgjEikAQL0cM0w+KfBfbTCLoD4ZfNV+hq5zHm
         O731FLaojIsR57soXbW4C+EvcJP+TU7PbCwzKKBOoFKm+5lThH+fidTHjGOfKfx62upD
         YqeA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YJiveGr5aGoqlASPJJItVzOKCYXYwcyVVgoPzFitdR4=;
        b=FNI5lvYEjBx7St/RtwO8re85v7EvuPAMIg9HqkZ3ix5zMoptRpn8+pzzqffCvTxlxb
         r/jyqu4pOmfg+X+uTz/S7jB2sz/Yzk94GkcDzqc2nhrLX3Tf7trCUZO/WP7VGKz+Yine
         qJDWJmeMj1rD5PeuCZo7uIyQNTjAWyNqO93OiL8Au5I2J6Gww+sMlfAUAs+puJkLcpKO
         Io/eYO+CNX2ZVHAekYnXpolRGESIxBhixFyRNgeDHZ4AUegC7CqVywse/QoUwEV3aA86
         BwVgdwjRINcVjvsBfiTuSqOgNPS9OVjtBPEbAx6CwGnCCE3Y0k4ejjkMVlGBEnx++sbc
         ooPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YJiveGr5aGoqlASPJJItVzOKCYXYwcyVVgoPzFitdR4=;
        b=Tsb8shyqSFFWkrcx5D5wlZfQaGJS4LRU57EL0LXouwYe6dcrviCXCaVuM/q8PHCpEK
         ZFm4jkUA4DL4JD15ih19V9mkX7ogAT7gOaHQmTo4wh5mY9YgsqtRjNy0AF4DAREVGJFF
         1pqIiZfgRFpfl7aQjgjb7Y14vTyWd0fxvY/K1EjfbP+hJb3ImO1clmHeSl7rkWrI+LP3
         cIbsnNp6T6zj/pzLOxdD0ZRhkgnFFdLdu2ah16y2QMZB8sex/adNWyqOICkmmEzmG0qe
         qfofUTv4UwbL4pnq03BsdN2/LuztBFOunqoREPVyaqyu0nCZD8awJZTywnX3+ybWRULL
         coFg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUFIfn0TwxUFMul6scXZsVOE6TJnQ8K9jjoBtf0FvSQjoKM2mG/
	QW2RvHXwIiJnySP2Zfk9llk=
X-Google-Smtp-Source: APXvYqy+QOTLZT5UdVsV4N3yxBPL0wgSrdB8vbPLMjwQBp7nudhzwEe++jkT9NAy1w0W/QDmhUxVhQ==
X-Received: by 2002:a7b:ce95:: with SMTP id q21mr13712727wmj.65.1563003444359;
        Sat, 13 Jul 2019 00:37:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9083:: with SMTP id i3ls3788462wri.14.gmail; Sat, 13 Jul
 2019 00:37:23 -0700 (PDT)
X-Received: by 2002:adf:deca:: with SMTP id i10mr5210243wrn.313.1563003443477;
        Sat, 13 Jul 2019 00:37:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563003443; cv=none;
        d=google.com; s=arc-20160816;
        b=wQxlu3Oef+9wY5SOQ04deDu33gFqRbl4tTJ85H6doOZFtLRUbe5GXbLEIQbYtZT640
         tskPXwp9DKkchjp0IT6xdRqPtugPkb83espHvsJn7fHUPSvIpEHOUlsG+shHSPuutUrc
         uFAfgSR2m3dAvXUD6SB+IlbxJmla/F4u5OCnqlyKH3MpuB7wRKSxB74cZs5Kc6KPqiUe
         dwJ1qnwCMU8RTN2h0BMw3R1YeE61fSpb3GY5EMeUIH3BffD8q9ZHGP5uqVQ8XQxZIsJb
         dk65HIukHMltl0vVCP2wphWA2A9oG+K6ah+QOpeYh8b1CE14LtUzi11wqJ6duZLqCDic
         6q6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to;
        bh=fYqWXkGiSSmvdHmBdEduf+DTk//7iyWmD1kkAsF2XU8=;
        b=ZrPq3nW7L7u8OMTGYrV1lLl5Uexry0g33ttAp6xBxKDGNsPcTOjiWf/O1QQwfEZ1PZ
         InCexnaGDuSjXGK6HLrxKM13qCCJjulPOowvpXzG7XLfQerQpr/F8LseyHa0ge6f0yHq
         fsJGseVoZOgt045d+Y4lIzdyLyeg9SafCs50CC/7k6MvfOkouxpROi/YMsKYbxBJQfrP
         +ch1yO6qcXQ4jExFvHF8fYIQpL+S2MjwMY3euRTldcDGLkOsjX1UIrFn0lh0XaBHDe6Z
         O8xrkdvx27JxJ17LVmr6uUNHnKT8qRaRmuE8Yle8VvoMMOhXNQrrRPV+0Z+YgLCE2vO0
         3Qmg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id r13si675350wrn.3.2019.07.13.00.37.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 00:37:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x6D7bMbP001538
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sat, 13 Jul 2019 09:37:23 +0200
Received: from [139.22.34.39] ([139.22.34.39])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6D7bMp5025157
	for <jailhouse-dev@googlegroups.com>; Sat, 13 Jul 2019 09:37:22 +0200
X-Mozilla-News-Host: news://news.gmane.org:119
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [ANNOUNCE] jailhouse-images 0.11 released
Message-ID: <09f26eb7-f1b8-b51b-8e0c-53c5570cd886@siemens.com>
Date: Sat, 13 Jul 2019 09:37:22 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Hi all,

this is the release of our ready-to-use reference image generator for Jailhouse
0.11. You can download the new version from

    https://github.com/siemens/jailhouse-images/archive/v0.11.tar.gz

then follow the README to build the desired image[s].

Changes since 0.10:

 - update to Jailhouse 0.11
 - new boards
    - MACCHIATObin
    - Ultra96
 - switch to kernel 4.19
 - add -rt kernel flavor
 - update to latest Isar
 - various smaller updates and cleanups

If you have questions related to this project, just drop them here. Same
in case you see problems or have suggestions for improvements.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/09f26eb7-f1b8-b51b-8e0c-53c5570cd886%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
