Return-Path: <jailhouse-dev+bncBCV335GORINBBDWLY32QKGQEQODHZTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63b.google.com (mail-ej1-x63b.google.com [IPv6:2a00:1450:4864:20::63b])
	by mail.lfdr.de (Postfix) with ESMTPS id 304CC1C5F11
	for <lists+jailhouse-dev@lfdr.de>; Tue,  5 May 2020 19:42:39 +0200 (CEST)
Received: by mail-ej1-x63b.google.com with SMTP id dx16sf1671775ejb.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 05 May 2020 10:42:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588700559; cv=pass;
        d=google.com; s=arc-20160816;
        b=GVxXr71gqwWe4VAnl0otYiVDHQVrvxN8ER0BaDECxNefdY3BjZzz1hYD8YA08Oygzs
         m+kWrVghivaNdmWf2TXogWIt5pYhUSZSpS+FdlxlLdzpeINytlyo+cFIG+uF5IYeBZe6
         uLNNV6K2lYVdUdcgMxFjDj1g+TppRZloCvXHbuSjZZ0ekdQD6cEM0aPSVp3NDTkQ+j3x
         O0c3SjAJ/tc7jDsaKA0/Vy9oHt9yO8jyn48zfiIOxPmlxzJv2bq+/WthGSCgd6w28zyM
         ddNreMj7tnRyr+QWAv2x6MQLnrcDPHk07oJs5xfa3pGRsY77qDhNxzZ0dfG9VaySz6ds
         pXBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature;
        bh=146fyqF4kmY0k8ijnn51i2YZu3AgYVYu6/p99CsKvEM=;
        b=lOH4KkGaMceA//SCYRf0W0T7T79DIfdPHASPORO6hgzCqLzoy6JHGJufuj60DPiQWr
         /lSmRtOOWUMVZAn9hsySuaihiaGmgVtQ+Uf0aVpEXSWavje/yNGN2IE6WwpcuaR5+yl9
         zwU/KaVWqyvFkSOBDsOcROe7ZzNi8DM1g0WIdrsLob7Bd7JmKjRPo5A0lAdRKY8upO35
         /5g9D3qiIfa33OJeZHSg/48Nt6REL6yR4YebvyI54ezQo4oTnstkBPU0cVS2NWvNgW5w
         zptU0iAkjsm7+7p13GjCTGU+I+dbuvF5iWwOKTtn3TsAjbOdJHTtVhz+qXUavZAFvyWJ
         bSNw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gOxIP0Xd;
       spf=pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::229 as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=146fyqF4kmY0k8ijnn51i2YZu3AgYVYu6/p99CsKvEM=;
        b=hLsmivPb//b+uruPHpoc9XqMsRcdTqrjis9G72McYoKaWCVwLEx8XC1w8JqIW8HkGn
         3OZGxI7HMoAVfR7z/hBorZcByhXaqZm/8xCVSSmjrwAHcE53PVugAVFI9pTd5p4hPCfp
         dDz0DCHzX1baTm5y1YXVA8WVxFNRVpeAOX1y4rvhcutUltwA74h2DHJdJApYhxsgeXe+
         y4gxAkqGKR/in+6fIDuJpzon/YI8ATvXyph579fED6Yt0LhfXeEssfgunNOugZFAMS4j
         3EVDS8R1jksf3SZsjRUTtFZs8QdvH4o8vFzyKGKLxtS9861ojX6E/pv+5sVKw8+tAtsP
         V9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=146fyqF4kmY0k8ijnn51i2YZu3AgYVYu6/p99CsKvEM=;
        b=AFAs29eFn3xItaNLfDbsOgq72/gHeNWdOjpTbqo12ltBMQxjFVUbVjScPjVkcyWa1s
         y7zb3O9sU+2L5ulOOo1KZFlTkOYZT0BpUzR8+y1CGbPT77d3KUBTiT16b11bQx8VWAel
         H1SX+tQHX3Vsop00ku1t38Z7CaPmEf9Chb8G3DctQnBhNtM8H8Q92HEmLUBaojDdkuxu
         0hd/eK/kpVI1RAR5mJgF7+S8h64Rprf1KaJ/0UG2VAKz1uZCwaNtdzISO9GfMntMRl4/
         XQdhqmCPCAwNDfNj8s1DzfRGIGiI/czYS2Onn/swaUsxMXYC19obEviAMq+IHyXPwl8d
         HL5g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubJPUhZ4gc+vuNpN8No0X8TtnjZpHunHWMdCh2QRsuWYmnoLp2N
	P+ZYk3xI90Ppv9vfzjnHEfg=
X-Google-Smtp-Source: APiQypLxbEXwXNcB5PNd2tITWLVKvZFuDMpQwe2pks4HgAejGvhH4tybJ2UrXOm+le+dRMxo87/6aw==
X-Received: by 2002:a17:906:2b43:: with SMTP id b3mr3588799ejg.231.1588700558979;
        Tue, 05 May 2020 10:42:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:d1da:: with SMTP id bs26ls1713110ejb.10.gmail; Tue,
 05 May 2020 10:42:38 -0700 (PDT)
X-Received: by 2002:a17:906:c44b:: with SMTP id ck11mr3987752ejb.110.1588700558201;
        Tue, 05 May 2020 10:42:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588700558; cv=none;
        d=google.com; s=arc-20160816;
        b=yiD9WEZE6V+VgiUlN2c/zD4Y30yNR/YOSiL2k945dnbcx0h/Z9C3voG7DM2Zw7JVgG
         LvFqmz8BpalYDgZ0d0+3DBvWOAy1Hg+vQLj5YnGc+tuPv/u6X0VBuD+2mFQt2rWkLe90
         o59yC78GGXznsRsbgjpMniYGk0nWm0DmpVii37a3n2qmIyVoNApBlt858UlPuobzrfzn
         x+lo3TP3Vz10xf7+kK462TbvCy81xK1dm8z34Q2sw+1dJYYPC8Q83eq+ATu4WoO2O6bz
         SNHHkBsuH3kSMw+QRYDwemrBe+Neat11oTe4fTk/0tFJH4VR6rs1iuZFkTo3fxXoumfn
         P5Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Hv5RRrsr4VECPUFIdhfq0NGwL0BlGclhTIH+38eqLrU=;
        b=zuy37hl2EBxt8/B5ZIlTpFNVO+LPYA10a1EWpOseucc5BsXJ7LtSMCi8Pme8ot48OU
         zFa6EGibDc6G0RsFnVj4VP5sQ3VNXJWZxzsKAIO97W+KLnoVPEQiyncTGT58N8lMAkRG
         /qLmiRvDyKiCJYGhLCZ1RJTj2zPUgZkbbmYIAuIjtAPloalfNwH7ZZitC0gUqCA/TCLI
         TxPkqRJfl8Wy3uZSrf/LPc2GsAaQzPqZBmA5dwgkfjqyvOW5+W7UyswFoBPj/NGbq/1V
         uQaO5QcBRw1lBiuu+o1l2lD4v7EX+s2co5dyU5AePWpYA8jaskbANpKwb8XgtcH133PF
         O23g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gOxIP0Xd;
       spf=pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::229 as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com. [2a00:1450:4864:20::229])
        by gmr-mx.google.com with ESMTPS id f24si111953edw.3.2020.05.05.10.42.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 10:42:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::229 as permitted sender) client-ip=2a00:1450:4864:20::229;
Received: by mail-lj1-x229.google.com with SMTP id h4so2524945ljg.12
        for <jailhouse-dev@googlegroups.com>; Tue, 05 May 2020 10:42:38 -0700 (PDT)
X-Received: by 2002:a2e:9cd:: with SMTP id 196mr2393626ljj.226.1588700556826;
 Tue, 05 May 2020 10:42:36 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Tue, 5 May 2020 19:42:25 +0200
Message-ID: <CAHFG_=U==gEqKJWV0_Na5eap5zUpwp3beU0A-7-+wY1q-0LFJw@mail.gmail.com>
Subject: Macchiatobin enable help
To: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: francois.ozog@linaro.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linaro.org header.s=google header.b=gOxIP0Xd;       spf=pass
 (google.com: domain of francois.ozog@linaro.org designates
 2a00:1450:4864:20::229 as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
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

Hi

Trying to revive memories to play with Jailhouse on a Macchiatobin.

I've got my FDT reservation as described in configs/arm64/macchiatobin.c:
100000000-13fffffff : System RAM
  139800000-13effffff : reserved
  13f2e3000-13f342fff : reserved
  13f343000-13f743fff : reserved
  13f744000-13f7c3fff : reserved
  13f7c6000-13f7c7fff : reserved
  13f7c8000-13f7c8fff : reserved
  13f7c9000-13f7cffff : reserved
  13f7d0000-13f7d0fff : reserved
  13f7d1000-13f7d1fff : reserved
  13f7d2000-13fffffff : reserved
800000000-83fffffff : reserved

When I launch:
sudo tools/jailhouse enable configs/arm64/macchiatobin.cell

The module says:
jailhouse: request_mem_region failed for hypervisor memory.
jailhouse: Did you reserve the memory with "memmap=" or "mem="?

hypervisor is at 0x13fc00000 as per the config which seems fine.
The reserved memory as per the config does not exist as it is beyond
physical RAM. I moved it at 2G (80000000-83ffffff) but still the same
thing.

That's certainly an obvious issue but.... if you could help me...

Cheers

FF

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAHFG_%3DU%3D%3DgEqKJWV0_Na5eap5zUpwp3beU0A-7-%2BwY1q-0LFJw%40mail.gmail.com.
