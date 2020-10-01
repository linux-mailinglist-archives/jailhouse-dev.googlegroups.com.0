Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBCV33D5QKGQE4O35DCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0CA280665
	for <lists+jailhouse-dev@lfdr.de>; Thu,  1 Oct 2020 20:18:50 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id c204sf1137503wmd.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 01 Oct 2020 11:18:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601576330; cv=pass;
        d=google.com; s=arc-20160816;
        b=KyoSxnKooVA3NBAyiJhoCjV7AyGhVx5Bhf8ZIcOa/575YSa3CCfN+89a7MTEut1nHZ
         t9WuRdIUCc09bfhTmnVJXQWZMlK7Z7wvMYyjDiXyk7VYhCYIr89ppR0GsskqMshRzkjF
         NHno0nMKq0jv8OfoM3r/MJ0c3FJ3Apclu2VequBt9ytTyZv4LYuN//MvRgIwrHqzUxgb
         vT6wm510R6LJKzzgtBqY/RuBoxw0i6wqvrNH+jRBVFTKUFnaHsN7VRh7cBrjbMJIwo9a
         ORJL2hFOb6kiYq2UlCK2VVMeCPl9A86b3WSgfbyBeObvLBvtSsK/c9u7uPWqzczadlM9
         dI/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=t8FkG2Ooewi/TswLbNn5bTp1/jP30YVpY+mFXKhvkMg=;
        b=bdFETT0pdiCjcpoZCrWy5pczi43LLRzcPBI/wBbaCZEh/5VUK8LHIhjEYyAR7q0HmK
         o7Gt5bvgvZ57vrIwt4rWzyJJSpiz6QW5/bmvHZIXMioTSp39+HhESCYnP0GXpn+pgG2P
         LPzBVg8mWUV41N7G5p1/ZNptuG/19xOYABxoelBzXad68p8mEHU6mMD9iR1BDdJkx8c6
         eqcrD4YZj9t2cRhwNOkNcBSF7o7cEVVXxi/Msr0ivHpXB6paoNZNiliZOjK3Gm/0CP02
         6Bv+w7fiylHMnt/5iT6dv8r1N2geoDdFfjV0awgpxc2/CiQQNjjkX8AZEyp6TW5Ehc7f
         Hj0g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=GqT7D9wf;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=t8FkG2Ooewi/TswLbNn5bTp1/jP30YVpY+mFXKhvkMg=;
        b=SX96d2w0m7DE1im/O/a3OMqAMqmFi6Lzwq6OQNPYiyZhq+lcxER7FFepcwChi4uE53
         T3xU/y/DyanI25RP9dwHA9IcKpwnh+HrufZueVmGqp4Vb5Stly/mEbVrV7eTIFVEH8zk
         O0Ric/Tn7GXis2tFBjUbjOJl8p+Q2R44YoAh7ngtV4g5VKbDxtGjOPthBxtHJtXyrcNN
         5trLhFEn+oatTWWSPf5vN1Jg8UkB2NkLhDY9estI7uUD11MyJSUeLbWkzlwrWdyimeX1
         lS7cko1h2PZLUxnAwv+2TrkQ5kCoQdBTyk2zuC0kEHyS+9JHDCJmj2qgGAxRRaWbTpos
         r2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=t8FkG2Ooewi/TswLbNn5bTp1/jP30YVpY+mFXKhvkMg=;
        b=UY60WdKxBpZ2kXiV1uvC3z70aVXiPQ7ePMyaYEmpDyAnROCxPBErN7ocK7kaRSt5kS
         T/pZ8wZRRPK9mXaZ23mKr0q46lLiZNuIKDpBln2QqGhgy4kRaYLqnCgEizQzUCUWEgEI
         +mfsrQqTnEOiV2/MnpBEetA0K2EydjQVjWEzhcT3pWg98DrOknEsOs6pXt7xjUHnTAE0
         C9Ng8i9BJV583oY83lokKy1r/XCPWj/bKThbfEvz/fXCux3k612vLlm1cKsuyVqIgrfe
         2GbypHcGfwpi7CT0qmEwvqt0E6KhMKkI/CH1eU0/9sdWUZaOrCMbpSIXJmMNcxW3Sd5/
         pjpw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Qfxdo0jPwUMdIk7ouNbUkwoJT5ArsxZv2FEpHDep8G9TsrgvA
	Ga3NzbwPSr1tGJ+ZBD8SL08=
X-Google-Smtp-Source: ABdhPJxQ/pE23fWn0KpzOClWMrr28Lu+vzj1ywFblsGQjEtCxut53jlVE51fwEtqSqxXNy1bOb5Qvg==
X-Received: by 2002:a5d:4081:: with SMTP id o1mr10793932wrp.338.1601576330575;
        Thu, 01 Oct 2020 11:18:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e3c3:: with SMTP id k3ls7890861wrm.1.gmail; Thu, 01 Oct
 2020 11:18:49 -0700 (PDT)
X-Received: by 2002:adf:9504:: with SMTP id 4mr10807447wrs.27.1601576329507;
        Thu, 01 Oct 2020 11:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601576329; cv=none;
        d=google.com; s=arc-20160816;
        b=i8T5m5C1QN/200YgXK3tVs/YGuNKcUdeGN+49NrJ3mCX/5QwEXNvMUOY2IJWqwhAYJ
         BUWw1SHNUS2CiaPJnYlpHXDEGCi1wHSfxP0X/35YJMlO1S6cPgQ/cqEQku+X9QFS8M+C
         sv0HkxxU6YYaIC0Ht8QEXpDxMmnwPRlFDSjhRtVzietYhTp1B32nQn1iYYhFtLExSQNf
         r+1mhB2subrS1HayPRvLNnvt6v9fKGFc9TxJMirXkn9LXSna6otuX8TqFi+valM+KRlX
         ValIsvnIezAxQDn8cLbu/PPNjdvEW+AN9SXOPGZHe2z6fJykPuqj8YFwm15KMiplG//i
         6hew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=sv2UtGLczPDtSJtNjyZwtdwTrbNwtFKM2IL4NVBfAyw=;
        b=XoVRk1OKD4vhoREcg7WPeUy/GZSChwvvSh90jSTRqbeLWiJiq2uW3fWu3zKgBTQCeH
         exJv22Yj7JmESsct6RKiy2lnsXICy/I6xgYmtUkPSdAP4BcJhT5OJUvBq3xxHMdD2SYl
         oEPqtdMpGvK5m+d4lfjRzONUXA56kAQuJUo15Gz8LnUYe4rRpw8RlKEUUlR5LBD9GYRf
         jGMXYov3tB4HkseLwUiaSM34y8UyhoZu6Il69Wp7wjOCa/ptA8t/ovou9TjrfH6P6BXf
         ZmCVEdOnpCaXCdWx9HrD+4uoxByYy2uNc+u7S62L4EFUcV2aTGIK4skpcUcKMsXyhD+k
         20QQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=GqT7D9wf;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id h11si131463wrr.3.2020.10.01.11.18.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 11:18:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LdalO-1ko4Wh0b4M-00ilcS for
 <jailhouse-dev@googlegroups.com>; Thu, 01 Oct 2020 20:18:49 +0200
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] ivshmem: Expand MSI-X region to full page
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <0c815f56-edee-86dd-7b91-19a8b6206f3e@web.de>
Date: Thu, 1 Oct 2020 20:18:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:4vCP5JmTKXRlq0b4DzlY3kjDf25WEMW6lADtEpB4X/17UF9C8ct
 +YCOS/0Gs2eEhXJImJgn0cHYqZzjTI4pJfrjFelx4bT/UrTB94I7eo0BrUKVG7C5q872CqT
 6KyeXI+ECrKuztc5JbpjSela3BkiYCaYNaqCpu4UWo9uyfzReHkIlMpvNmVGFiNAg6+50X1
 rb7BkUcqSNG41/7Bi/qAA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0HMoHJweSEU=:N8qqITRs28/nvhXLIdUd88
 CyoAa6t5A0U+tpkMPHwiCHLKP+E6ARMe0gTpsDjybNKwtOiw3rt6ev8NEVwy4tFREyRhis8u3
 JEfNXjLvEBcdOBsEzr3XRWjb9d1+gWHoo7MEe923gdt+fi97RUCWoE/KmtAbYheVrf8hHod+O
 8oV9UjnG+a/or9VrVsDamlC4WcIJGyM+6irZ7070KyWYuIkoq/lKxlIBwKEYJL8te6OiAYQ/F
 w3PxDABwn4Xo169vh67P0+U5vuiDqljTD923CFRko/b38H1LO8kyjVHu8Ex1t6xyA7WaR5cdg
 czmBiG1pPHXdJK77+9U5wujJqaifJ0DdtwnM+zReFkHVsq1x09xOk6Oci1qb11GNMHpY3EO9Y
 ZXREBO76SSYj5z8yf+ZqxYDjqye7J6pG1l14wblbozDAiOAcNNSwUizy5ScT1xp1ZLvFt3w9m
 mBvfcq5sqeNoEcu1L3CXs9uMblHAN4HBkg0FFqYZXju55w11E/jxFcz7heHGtbL+MT9Be8Cmy
 Ql6cUoSdPs5tRl769lgn+x72CM7juYSGhzET1tKggM375t0pWLNHPkAEl+rBu6eIY2Fx61JV1
 XMwRxCjMmzDviXIQ8ZK0H3gtNRvCADc/md/rUVkfLX54eBsXqxMQjUxhPEh98kUyqjJA9/geE
 oBlnyerEM6PSCV0OrqKtUHpzDhoA78F86ebk8HN3ElLdKqBlGZ0evTGDjfrG5Ptnf49uCpl/r
 5lZnf9JgMVPDQiJ6tYcbmYwkvwmzW9L+MtJ+ySCO5400PqgzELtChiH0YtKtgkthk0DBwfWug
 KIBXU4fgkUDZnWXIeokH9hx/xP0vp9cWUZwKHyIDOdT//iZkBH6WAz3MWKT1fgsNq/Ow1Y1XA
 fMoAB19betKmQKhdCjPfVYyv3v7E65aUzaLSTocmtQF1jxb+qoze8h55iFfT9qq7yioowH2ba
 kOLxIC3FhGp+3+FULhKACBrohr0Iwm9wXqIlXQBks3IHexwXbz1+cezfYlwkCwyFU908I/3Em
 Oew++f5KJXVHFRY1Xj4EtMKjNo2LntrzGMQpRbVEFsfLSm4HhcToYLuODNpE3E6+FVxaxyRK0
 8jpZBkgB/OZ48NXyPMvb7EPbP8AIEtDOYevtg37RLU2ROStzcKZtlKS3KqJutAZY34MWWVYP2
 ERIGVuHOg6wW/uE5x/fY67NlIZyfKWZhxH5A1VQEcFC4OvewaSQVWKfTcouF38EK11Ei9ahwe
 Lc9tGSiFsdPL5H3g7I9ncx7y8QDtDOIwx3vPXJw==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=GqT7D9wf;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
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

It's a bit wasteful, but the alternative can be that the guest moves the
region close to a physical one, and then we need to start configuring
sub-page dispatching. That is first of all a source for mistakes
(specifically in combination with generated configs), and it may even be
suboptimal in case exceeding, full-page access on that physical region
would have been safe.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 include/jailhouse/cell-config.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index fcc58cfb..472cb4bb 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -223,7 +223,7 @@ struct jailhouse_pci_device {

 #define JAILHOUSE_IVSHMEM_BAR_MASK_MSIX			\
 	{						\
-		0xfffff000, 0xfffffe00, 0x00000000,	\
+		0xfffff000, 0xfffff000, 0x00000000,	\
 		0x00000000, 0x00000000, 0x00000000,	\
 	}

@@ -235,7 +235,7 @@ struct jailhouse_pci_device {

 #define JAILHOUSE_IVSHMEM_BAR_MASK_MSIX_64K		\
 	{						\
-		0xffff0000, 0xfffffe00, 0x00000000,	\
+		0xffff0000, 0xffff0000, 0x00000000,	\
 		0x00000000, 0x00000000, 0x00000000,	\
 	}

--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0c815f56-edee-86dd-7b91-19a8b6206f3e%40web.de.
