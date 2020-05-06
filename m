Return-Path: <jailhouse-dev+bncBCV335GORINBBXMGZP2QKGQECTYQO2I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6ED1C7260
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 May 2020 16:02:06 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id r11sf1352984wrx.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 May 2020 07:02:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588773726; cv=pass;
        d=google.com; s=arc-20160816;
        b=voNPcks/iFu1WA7aRK+1z7gYd1/R9pgqeLmM42wFi3fPTZHTIDWN7f+Nl8012jNerX
         m806lFFRQ0wZYWqM+F2UJ8NRMxET/coMWf8Fm+4U7NqsFPQUI7OSgNqT+gQcOVBiqVcb
         xrsoWnk+2BPkUi3TCzH3vpVTM/AoibZlB90kAQu2uumVaHATiErYvXb0oVu3aCqvgcA9
         +JXKw1gbEcvgtClwqMVkUR0ZzO7YGbh3Aq4jAPWXlEmOLmjsz1t+p/iQuxXeBEGZYI+P
         a9uOGgMxcavkZzKwZ12dXR5lGD9Tpy39A+BXwsydxz6g5mdvjXgddVWmKxBNwypzf4zn
         m60Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature;
        bh=31v0ZT0YdENozVjk9L7cpXxK3UQVOmn4CnwZS1xP2+k=;
        b=dCl5NksiylNynEEOfmDu7m1xDd3g2wfZg0tOrurG/xcV3EtbYPqwwb5ZKSlvi/CZED
         /zBi5KQFu9Bue4ZSUcswLP8w5FGkVl/a/Nu6ivbqBAhVGgCF3jw03lGN1GwjEU1zmENZ
         vKPpeWvFqqsrj/0IWDeLBQQIQfw/niDCjz8yRBu7IAG3SPwI2NuG/jO/BE9Gdr8F5C7x
         1osjFX3d+xCFQrzDCJp/USZV0BlpKE8dq4cGi7VGjUgSSx/UptmcaxvSKBoINW9zn3Oh
         fejxZsQ1qsiXdi8yvSSALJ5JT4oYp1AMKsAlT7cYBqHkqh4DvxjH50dBjSE5hKGHLM4k
         IYzQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DcFz5oto;
       spf=pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::12f as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=31v0ZT0YdENozVjk9L7cpXxK3UQVOmn4CnwZS1xP2+k=;
        b=XyTZYaenTauRInrYrzrnMcPSNXlVrahUjFjMWFVSI2SSF584otROSS88e+0wDay6mP
         /qYcDCTm5QgDAF08Fp90vW8XfN9yZfyqrihH7l7HnbxCmTEDHu3nJbOfDVqXVLkRLaCR
         yHaLGo7oq/9ADZX8vAPXDnABRKzilktlsq0vbeBY6d+gab3CEJi8jgWy1LMHqOQKe9cj
         h/Q900xWyR0o/Xdbo0TwxEDlUn2UcJ47vIBFMZqbAX0eX8GM0Qqy/8+felT1wS+/OrFi
         CHvTTUSNpSc7y4udmlARP+F+Z9JYoelUZcK/lPBsL4+hyXME2HLKC1USPAvhCQIj75iA
         a0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=31v0ZT0YdENozVjk9L7cpXxK3UQVOmn4CnwZS1xP2+k=;
        b=O4N3LKDSDdI3u8kMoZ/okQYuieBGrqLddlaaT0Nmo/k3Yf/AW+pZwj/Cksi+mau/NL
         V21wb/kG5+J/Xh3pm7wYHjf9fCY+oxaguCTIbjN8GzD46m6hhQXtc8zeLluYlLEAdg6q
         oZQW42EUbHuayP9XpXwhuuRXHDoOAq1nkqFIpErfSIR3cqbx1NIUnQYFos7BgJ/9cZ+q
         ldCvB+ih6KfxHuaDykiVckFIiuO5E0cuBN09Dt9PMmJwof68BBicbMwbLhGM64oZhoY5
         0Lziix31bFNJyX5dzDpcOHvdSMAbEJVKKLLGRPqT3O+Ha2gU+l4xlkff87pLZgDS1u7c
         xnxQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0Pubg4HwsuYdTDc5Hyp504oBuBMAOJffcusgAMT91owpX6jQf0DS4
	V4l+63ykUBUb5YEw91mHsIQ=
X-Google-Smtp-Source: APiQypLfQSbpvanIsZs99LXYpuXBwfrn04E6cg5hZqS9CkVRLxL2fXCQJMCJzpoYbV6ZmVw/QgQmKQ==
X-Received: by 2002:a1c:9d8c:: with SMTP id g134mr4704101wme.79.1588773725746;
        Wed, 06 May 2020 07:02:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4088:: with SMTP id n130ls4122429wma.2.canary-gmail;
 Wed, 06 May 2020 07:02:05 -0700 (PDT)
X-Received: by 2002:a1c:e444:: with SMTP id b65mr4839946wmh.6.1588773724987;
        Wed, 06 May 2020 07:02:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588773724; cv=none;
        d=google.com; s=arc-20160816;
        b=cZwZXwwjTuV+BZZH61H4lfeuVdXWnA1216HhsDCNTjCyTk/pJnWD5cACRlcoBcEg7d
         3VLBRK0U7i4FcpfEdOzFOI1dCU49f9sFJ8xFyrz/+/OyyDExZE/rVP46gw0jwOFxxQdh
         dGvrfhBmJ9+sWZsPjqrp2IQe9S1yUtX6BGnrgxqx2zXwIGm7S395BDKSJ7/q138S2Wgd
         pPkw8cDC0LwkTF6zWEL+v+rSf5t93AWmC8mXmE3aSLZHtQ3uC93FYqR3KY5JcNgznp4/
         8d4ZXW6oqGSDDG0zethDCEYjlWuifvkHrdimfIyt23VET7itYixFciRJdI9smQW50T4P
         w8kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=M086q9aF4lxYYvnKutVpv80zpLPtEiE58rADJeZLOKo=;
        b=Npw7oG1W2QyEY5DSuPZYlr6CtBvWObZYiMP9nxzc3OpTe8W/yPVuUzg+RcrxxedY5W
         BbvJZGFMa7xNwQzKl3+vEUYOH0kDS7Q3wPFyglJc40cYiiPDJzbxJ58Bx8o23pvnzfkq
         KPIO1zxzJvjlYyXNLj/YLcCRV984EHMiEFFMKogcgObddnlfn3qhLGsegwnDqbZYUhHV
         lGqwZIq0b8WRk9YVFGvXVqamzA+kUlv7tVK1x1nuQgcx9FXQkCbFHOTPE20aqBuBt+xY
         B70eGuu2YzVPPbo7rnIL50S1O/Okv/VANNExbG+57b6fjDJP1WLGXEwLVdGNySYnR/3J
         mwww==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DcFz5oto;
       spf=pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::12f as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com. [2a00:1450:4864:20::12f])
        by gmr-mx.google.com with ESMTPS id q187si145814wme.2.2020.05.06.07.02.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 07:02:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::12f as permitted sender) client-ip=2a00:1450:4864:20::12f;
Received: by mail-lf1-x12f.google.com with SMTP id b26so1440840lfa.5
        for <jailhouse-dev@googlegroups.com>; Wed, 06 May 2020 07:02:04 -0700 (PDT)
X-Received: by 2002:a19:f610:: with SMTP id x16mr5286077lfe.79.1588773723640;
 Wed, 06 May 2020 07:02:03 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Wed, 6 May 2020 16:01:51 +0200
Message-ID: <CAHFG_=Vnx5ABnpqbg8RkRDxVS9C2X979cfgzFEszcEO6s0wLyQ@mail.gmail.com>
Subject: KALLSYM dependency
To: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: francois.ozog@linaro.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linaro.org header.s=google header.b=DcFz5oto;       spf=pass
 (google.com: domain of francois.ozog@linaro.org designates
 2a00:1450:4864:20::12f as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
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

the symbol "ioremap_page_range" concretely requires
CONFIG_KALLSYMS_ALL to be defined on aarch64 (not tested on Intel).

"ioremap_page_range" is defined by lib/ioremap.o included in lib/lib.a
and is not an EXPORT_SYMBOL.

There is some decoration in main.c:
RESOLVE_EXTERNAL_SYMBOL(ioremap_page_range);
but that only works with CONFIG_KALLSYMS_ALL defined.

As I am very bad at kernel build system, I can't enforce the linkage
of lib/lib.a. I have tried jailhouse-obj += ....../lib/lib.a without
success.

Any idea on how to overcome this?

Cheers

FF

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAHFG_%3DVnx5ABnpqbg8RkRDxVS9C2X979cfgzFEszcEO6s0wLyQ%40mail.gmail.com.
