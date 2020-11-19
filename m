Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPGZ3D6QKGQEQQK3NAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6322B8D13
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Nov 2020 09:28:45 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id e18sf1718440wrs.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Nov 2020 00:28:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1605774524; cv=pass;
        d=google.com; s=arc-20160816;
        b=TGIMCCbeZ91XBBqILiaVAMUfqxHJu+iRpycdrwUPH+v7BqyMpn1jzsvuEWdgZtT6mi
         SwOdkgvb9vWM5TE/EFSuStNj5QQfL5JvfDOlJ0gGjk+JpFW3wge2OaWl3L0F9xqxtP56
         bCET3orbngc8rUplratVmPd93vb08UAsPPGDtNrIOqv1sA8nkcu794HrIsCfXBMp1+/m
         zt2TNzcFnrR3QaW8HrPd+/zj68KScjSpY5azoRC6P4m6Rtg1EDLXThkmWI+k8u9SYavO
         8NoWnC9UC32XrPAGqtMDKWrNez8cVNaIH97lB9kwsjMVE+Oj7fHjq3q0zfRjnPS+yAhn
         /7NA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=i4Ln12eoKjc0X1X78EUYg7rsWz8Y8TIiTGnwtWnxqU8=;
        b=MLUwlNOp2kvcXiJBJr82EDScw+j/pPTot6wdF3xxhSi33CseeNDhxAZsn4ejrKSYnS
         ZBSEikH6UxJPwu58DKoAB/XqdKMsM3l0RTD+a/JazDGbNmK/BA+LQtPHHx7YdkNfVrzc
         w/NAo3F6Jasf/gLe8Rh9PCX/c3Ihmutkf09sTY4on+kLDjXXWQFgeOXGKbh3Ne1vP2Ct
         KxU6rQFKHjYKXmLMKEPvH0PfNQvJf/XA9lHRvSl55FHJkKFHco+LYxr5PLvLyykdu0/n
         zK9+8RXi6bNlIEzEURWtaWf3Qsl5wim6q0q39FwL/Q0CGPCopz/8xNDiusiVLqNjcgiX
         mOWQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=i4Ln12eoKjc0X1X78EUYg7rsWz8Y8TIiTGnwtWnxqU8=;
        b=faNIQHkHA/MdAjHAcmJu1Vc3XysZXjHRg5CmxvAnPKq0L6NV9MP0jpVD++TCwVpxmq
         mZGMIESeKc1ujp6tyEyBzcI2gPsyjOEhZw0WQWs1Uj0KR2mloaWOKMQuqL/4iBRL9Zf5
         +aoE45P8lsfhsj3GORV+vbJnVHdPgVyR07jsHyXpkUujywTRvWdtVfPXHLt4ydoLOAJQ
         rkfkU/Mmz0QzfQ6kO+5pGCw+wERthIGz4P/SVqjdGiWQf7XPST2oJKtQBCvMSRcpRZVv
         vqsPs0jye+WT74DATUND08M6ruAaeNEox7RbKVweeIxiaJ8mH2Ia8qIrwWJcGEbhUQJw
         33cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=i4Ln12eoKjc0X1X78EUYg7rsWz8Y8TIiTGnwtWnxqU8=;
        b=WCyPeutFpCyg9Zu2VOudAagF6OCtH1tdNkGtZWx4Jw+gKj75c5+ycpPEvvsumv6ya2
         olAm05YHonlg5OKX6AWkf+O/e3W2xwhUwrSSuIpGqs4k9X3ukCmTA3lfaY+FmiP46NF9
         ggHNxo7h/P9chg6moDGoZ29uxPntAxvyb7DhnAYKTSX/yph3Kqn0H/kudSnm1LOzooKq
         fjWSpm+TXan8TkvEZsfjRtJVlI/1vyk2R48+htOMelZM1o7CM2G6CtUO/9qCgiyNHsOa
         DfvWrdVacAbcEO5K4+8yO/pPOVmG/fIq0JP4C6Ghc5Yds6aYllJICowDOYtmBQdKCl2J
         wwWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531P67DDEf8G6swl9BkOJ6+N9q5xzfOXEaHzbzj7Z3TPdsq7lmdv
	VLcLLS0cpVb8t+QYcv+Uf7o=
X-Google-Smtp-Source: ABdhPJxup9H+kCHT0J8rTNeK7UjG6wCIjvXOZFphiZUGcu7PLOSS+n/pwxB6YVO+0RfJDEmI6oDqzA==
X-Received: by 2002:a1c:a445:: with SMTP id n66mr3361954wme.51.1605774524763;
        Thu, 19 Nov 2020 00:28:44 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f70d:: with SMTP id r13ls2607031wrp.1.gmail; Thu, 19 Nov
 2020 00:28:43 -0800 (PST)
X-Received: by 2002:adf:e3c9:: with SMTP id k9mr8919820wrm.275.1605774523819;
        Thu, 19 Nov 2020 00:28:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605774523; cv=none;
        d=google.com; s=arc-20160816;
        b=Xc7rOhclpiXZDYco7RJ77q1xOLKEhhYhDbhfdDBnYqZNaeNgeiDkpbJC+CjmAsEczq
         DC7uVT8oZHhABVx7M1YfJYC6zdECs54/kEdvDPstaImG5vLgZiVZrjtm0PEkX60E+hwX
         PCDkpvqiWg+7W26y+af0RmTLpeo7XvDy2RfoikMb3Ei9Zclec73ixM5dnkdnyqkd+ODt
         0Lreq42wb7duVtbu1AHGzB7CGAmE/PoCVxoZ1RovznPN1tCn7u37U0Riif88JcgfAsbe
         kS9TSrn6p7VuGwzniuNW552jMKLz9P/5l7FKEfPqbkUFWobshLm4uP/cQsRFd62T9jYc
         GJoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=iSfcpjVdxLVI6PJ5OsKQZJyVQQwSzb5OcmRhB/ANdbQ=;
        b=PlmBwMeB310nyVUKLxWl2avnKGerE6q13OIs4UbtE39GyU+nipWATbV9j0zjEhRrSL
         QMuQXZ1x4+1Wc0yz7DSQzmShcK7R7nFn3hIn862IHBZ8a3b8V0zsnMbg7h/Ppc+7dTT8
         oG/Dr/auhxmsf3/nud37twlhgJnJ0QK8iIl5GuTHJftQUjEL2ctm5moh7E2MwZ6EQPlY
         EHX0QcVVf/fD3U3hmVO5k2qEUJxUWWLCF/pwpSA71wOkP0co5dlfea1rGiTcWKiNOmFa
         +My2H1NAr4PVXd9yETRvqtRrarc7LiDfQ/DXD0FVR7KAjzlSWhplciW25h1U/Hn8qmao
         28nA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id r21si1186842wra.4.2020.11.19.00.28.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2020 00:28:43 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0AJ8ShmW023678
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Nov 2020 09:28:43 +0100
Received: from [167.87.38.29] ([167.87.38.29])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AJ8SgUA025824;
	Thu, 19 Nov 2020 09:28:43 +0100
Subject: Re: zephyr ARM64 SMP runs on Jailhouse
To: Peng Fan <peng.fan@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <DB6PR0402MB276052104C2CE78B10D2BD5188E00@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <fd4ed87a-58b1-2767-8a28-f1ba335582d3@siemens.com>
Date: Thu, 19 Nov 2020 09:28:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB276052104C2CE78B10D2BD5188E00@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 19.11.20 03:50, Peng Fan wrote:
> Just share info, we have enabled zephyr ARM64 SMP on Jailhouse using i.MX8M
> 

This is great news, indeed! Do you need patches against Zephyr, or is
upstream ready for this? Would it work in qemuarm64 as well?

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fd4ed87a-58b1-2767-8a28-f1ba335582d3%40siemens.com.
