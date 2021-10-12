Return-Path: <jailhouse-dev+bncBAABBIXQSWFQMGQE5NVIHKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33c.google.com (mail-ot1-x33c.google.com [IPv6:2607:f8b0:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CDE42A3B4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 12 Oct 2021 13:57:24 +0200 (CEST)
Received: by mail-ot1-x33c.google.com with SMTP id o23-20020a9d7197000000b0054e537c6628sf7931220otj.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 12 Oct 2021 04:57:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634039843; cv=pass;
        d=google.com; s=arc-20160816;
        b=PKQjvS9p26pc2GlxSzZBMan3kGnRINLl/i4zv0uF/gFI61wFbscPEkddNAsIoKR/E4
         nBEHzGrCOY3UFK8K1YAirN1/QfLSJmCZrPmBtdFUDasdrd5YNoO77SL8w6jwGXmrCGvs
         w7v3kMdh/IMcQ6guirLtB2GGR7JCwvC2wp+II9gAIA9pUqkTT588E1li6uJrfijWTr3D
         6K2+G9YNpu+93t0mr4Htulany8hSHjxOXlrMQAN+wxe2dz9AkatQyLbT5HAenfbsEyXO
         29yLKRSWcZ+xvNeWd6fztgnllgS8LLiJBBL8yf/3sNw0CfKvfdGAEn/Is0afSFngtEWc
         hRDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:cc:to:sender:dkim-signature;
        bh=fL/A4lCatWVp699y/dEwHspZXsYrkzjhiYV0AODMNck=;
        b=MFxWuZvvpVAxh8oPc1cy6vRLHHkARtXKYqmWhqTyYEhrdl1aga19hbGaTvQno8BQN0
         9zS9FGSN/YUu8+kvtGuy4VF1p0tkmeWE6eDgv3Cr7Wgafs9oZ17ueV1ubQefpXbuqipx
         lHU/UVkUw1meily5Yj0E2RWnzmvD6DtAy04rlOO2FJRRjdm4xL7nq7ZiuTCFYbs865x7
         CZNF4mkAvU5YFJWNyUrhGFnFpn4TyMvptCYgEz01x+A97OYkD1j2Q4U/UY4VoJG4gsII
         9dLW/KN/Bl32bQbXwgBcIcTAAPp8UNCepeixCoMo9CWnIBSF9reuwspilVvI8z70Zejn
         Iykg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of zhengchuan@huawei.com designates 45.249.212.188 as permitted sender) smtp.mailfrom=zhengchuan@huawei.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=huawei.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fL/A4lCatWVp699y/dEwHspZXsYrkzjhiYV0AODMNck=;
        b=QXaGcbRy/ynl1RCn8j+ybRtpkQwwYRtTQfD6t1tlvZ31LSshChU7SFWEa5YodadP+a
         neojcTxusNuiJMU8tv98BdQu6SLMYDHxgP1xt+WA19wsxBc3Fr5/2sV9pOD8v+BQcz4X
         fpC+gJQ91omA6P9F4wAYZzKnQWcjfhz0m7Sb3FpVgJsh/lLhm5h4wXRv7+2FVltkYYIE
         mgeXqR7nWjZq4uNmg4T/Vx3V2722sNt4hlqAN60eHZVqD4mF9wccsJRw0sq8QX2avJEq
         ReBDl/hK7rRgRE/3BAtG4Jjes7ZXq4nFled7lqD6usYCwDN0hEiQS94qTisuZt4qUdTt
         GTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:to:cc:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fL/A4lCatWVp699y/dEwHspZXsYrkzjhiYV0AODMNck=;
        b=t9o0gSWnAzAs3U8vuoYb3H1iDoaPeERiT45RkNyMuOcTKljzxaMmRITDZN+ENz83cP
         Y11xpYnejC8Zu/pBgClk4A19SyZhMCU5cxF55PvTW6SMwW6gkCDZHV/QmPdm1OM0Zm6n
         KLlRRYh67mxU4mqKelYBdELjZFvpY63Sk++TXL0rQOXxYwgunMEMCUb5B1ReS723hYYV
         MtTYQ30Ta+1GaUl/xj8zMCHQmM+vZIOZ4VcypDqxok697PryEaAk90MVbAsBBdQJMAsK
         uddaSOHLHiV1K1uyDTHtKaZ/rDe+seWLH9roCgedAiX4czpYcLL4uLbL4KsER+D0ggLN
         UEQQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531S25BlnNps7uNcOEa5RTnLSLmY3mXJpL3T4ujmj8Dtfv/D+GWS
	L/umjKkmt8vZ04SuXVTujNU=
X-Google-Smtp-Source: ABdhPJyx3X1dG1TFlQLVIW2gV9HZa+76cIZflJEIrxXhTP8Zeyd1ealy72dKXYjEg/FF4ZiBhM4C8g==
X-Received: by 2002:aca:650b:: with SMTP id m11mr3231498oim.26.1634039842866;
        Tue, 12 Oct 2021 04:57:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:ad53:: with SMTP id w80ls3605681oie.7.gmail; Tue, 12 Oct
 2021 04:57:22 -0700 (PDT)
X-Received: by 2002:aca:32c2:: with SMTP id y185mr3242249oiy.47.1634039842530;
        Tue, 12 Oct 2021 04:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634039842; cv=none;
        d=google.com; s=arc-20160816;
        b=unchgw45LZxjW3miyPhCrTQ/Sf4uSlUsXHJeMLTujbWG5ME9rRTeYZ3p59mq03sBIa
         NTOYnU9seQokLsoS8udoxlJfqqFnziPeJ2f5Vin/XAYjZoGuesx+2PhAlKJ3YDwCooSz
         bwjpP+CbBRCwOQ3JUmvHCFoe5H2WjxFwuHiJtOjgrX5y8K5xrrVUvlJbnZqhLOECzRi5
         ntOVwNHHPC4uoNFvpRN4kh0VFdzolr7f0/YWhpeIwQ1iLpNXi4Ad02JTjnxqefvJiTYA
         sqqsE3lMD19qftNLDtDisg17djqcg52c11Wz8bniflXSrNnpzaAULb988k20WceIOgSW
         /hTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:cc:to;
        bh=sf7FNIbPT7uoFhotGDUybKqnN0kH6lToZuIP0JjS/Fw=;
        b=LV+U+dg6jeUhXflNjyuQeHGArpgsG7fmLDqml6YKvJxBeQKaGjaB6z9zxjIf8Yil3h
         tkfj6/qjur4uEX6Yq2zHpMHUzDmqmCZBEXcb+OkCl0jK8EQwtXjG08JjMxI3SQUmB7Ps
         vfIp5yG0167I6btquMmBnUdQVmfqOG2D7dPJPLZhytctEjv66JGBb8JH71UBWSmsW8tV
         2pSz84zDL3NnJlMzJudwLEqFiVEO4p2oK9a17NTS+vNd3B7rA3/guV7bhuTV9ermFWDx
         dSArYwLv2iV+KVXEyQLaQjTN6D+8lNYefaMB/qvyflAZt2RD9t98DzuY055ciwickF2i
         D5xA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of zhengchuan@huawei.com designates 45.249.212.188 as permitted sender) smtp.mailfrom=zhengchuan@huawei.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com. [45.249.212.188])
        by gmr-mx.google.com with ESMTPS id bj8si1551354oib.1.2021.10.12.04.57.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Oct 2021 04:57:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhengchuan@huawei.com designates 45.249.212.188 as permitted sender) client-ip=45.249.212.188;
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HTDYV3Tkzz900t
	for <jailhouse-dev@googlegroups.com>; Tue, 12 Oct 2021 19:52:30 +0800 (CST)
Received: from dggpeml500005.china.huawei.com (7.185.36.59) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 12 Oct 2021 19:57:19 +0800
Received: from [10.174.186.51] (10.174.186.51) by
 dggpeml500005.china.huawei.com (7.185.36.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 12 Oct 2021 19:57:19 +0800
To: <jailhouse-dev@googlegroups.com>
CC: Xiexiangyou <xiexiangyou@huawei.com>, <changzihao1@huawei.com>
From: Zheng Chuan <zhengchuan@huawei.com>
Subject: Questions about Jailhouse
Message-ID: <830ab7e0-e8b9-edc7-8a3a-4acdb8b0216c@huawei.com>
Date: Tue, 12 Oct 2021 19:57:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [10.174.186.51]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500005.china.huawei.com (7.185.36.59)
X-CFilter-Loop: Reflected
X-Original-Sender: zhengchuan@huawei.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of zhengchuan@huawei.com designates 45.249.212.188 as
 permitted sender) smtp.mailfrom=zhengchuan@huawei.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=huawei.com
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

After reading the code of jailhouse, I have a few questions.
1.Once Jailhouse is activated, the boot Linux will run as a VM. If it is possible to run VM by KVM(nested mode) in the root cell?

2.I wonder why the root cell need to runs in guest mode? Whether jailhouse can run root cell in host mode, create KVM VM inside
root cell. So jailhouse can support both partition and VM.

3.When create a non-root cell, the jailhouse driver executes cpu_down() to offline CPUs, but the offline CPU seems to be running
and respond to interruptions. And the hypervisor seems to have done nothing to wake up the CPUs(assigned to non-root cell),
or did I miss the important part of the code?

-- 
Regards.
Chuan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/830ab7e0-e8b9-edc7-8a3a-4acdb8b0216c%40huawei.com.
