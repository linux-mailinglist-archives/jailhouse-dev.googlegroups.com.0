Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB6WA6OJQMGQEZLXTBZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F326524A36
	for <lists+jailhouse-dev@lfdr.de>; Thu, 12 May 2022 12:25:00 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id m2-20020a0565120a8200b00473a809c6e0sf2012981lfu.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 May 2022 03:25:00 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1652351099; cv=pass;
        d=google.com; s=arc-20160816;
        b=Bhtt/OoO2JmnjCjHsIUgAJssgstLDJf54P7O1tklS8FkenTIIYM0KN+7nuhv9qmBdp
         gFmJbjB31O8EM8HbnBqcws+AeQr6u52AK05/v28vUnuYLEiRtry+0Xp4gk49UmCa4a6Z
         ytz1L5hOmNncB8wUGEx5VTW/OnYOdjOpfHY3nlyeQBHw6I1RNW4yo+kEHAcYo/i58Ckm
         1jf0FnrtXfpkOpshAIEj3/ZLFRBUcHJR6YC2Yqz4iH3HNqLu8PESn7WXrwch2zyc/+0E
         tg/f31S5EBjE94x8iJZWkwWIFsX96vrxbCQ+Gg6QwCMjjHhGH+srqqOQgSP9MG2AuDND
         NSSA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=4wIN2jD79YvQciroWOlwSmPMjA0agOf4tjsOr4qEgb4=;
        b=q22u6Uq5C3xTnk+YliMQgwOxjDo0AWzlEjwsKMvy0+V1cz7EQTugp8PqTo79j28QPt
         hJKAfli4yl4Nh3wjDLFPXBJ68lVi90yOvtFZyTyYjvDxj9hVrwFSXgN2vR/VdEhi48G7
         1oxl9TkKq0eyCDmaOypmMx11eHSVBsCv+o8VD2hztCchfshK+5aWnTTCJDbiK0rNlgtL
         X36nhol6njxJDe0IkHyQdiV6BiByfQr5bvCABquh/Tq8VhBeVi7Ycxb3q3Tw5plPsPQI
         1J4HCAnjF1uiR7dRaY3KlT3DR3hIthyHVfs2ygikk8yoX3LwMiYtMII//mgGHK/Jz+1Q
         4K+g==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=Vh+wet6v;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::627 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4wIN2jD79YvQciroWOlwSmPMjA0agOf4tjsOr4qEgb4=;
        b=KcJUzGs29iu1YCjbwZKhele2vrvXXbE8UXJ7VObCiRXU72EjoEk7fZ2D7b2dGv8ziA
         x4Dxw2HHw6dvPdI7s0Dn7IbKgQXiQSKGe7kuIfdnualEsHM4dRlObo2SEbPQzEELqE0/
         BHkjz4WYn/JQksoXjO4KFw/Sbfvd5l69sW9brQB5dM7CkMUhRqoSzBbi7gH+wdMIjtHh
         uky3vkkFZyG3T46PspYG98pd5n9lqIkLpWqCyTmvoJAUa/XHFUvdQeul3pvLxMPqnP+w
         cj3kxKirCJCvxumb/OHuQ3a9lhpKfH+Ytbdy+xmgCLaBFGV6DbO3xx9dCD2OfYr4RAE9
         uHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4wIN2jD79YvQciroWOlwSmPMjA0agOf4tjsOr4qEgb4=;
        b=6okzabnmjEpfqtaI+0DBo66WzJnWNU5stYiNIBQn6Hy5ExuwQLaz2ABztTX+b3D80J
         9J323WdTb6OGZRh4AJUSFy/PXWkXNxz/LhDjmaLHlCPcKQAh2+KQupExmQx+FaQhVxiy
         MG8Yd0acj8LBHOKbCDRMsSXvABh8bowZf74gfNQD8QSslqALn1vcadvK99LCj/6cGqdY
         MkZc/TuuJAo+TAIkLfqja2LJnhdv6XBC8CJ3uY4vP6o+/kPZYex4P3KPg9s0/qQmWH+l
         9HvWYsFe+kLZRmoQhWI/Xlhx5YVVvJMsGzDPNbgsOIBVBCEwlumpPVgc1vv1cj4rGvFl
         7l8A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530+9xRyUpCBdTOFuJnMXJz908C8ZygjWILoCobPWLhrahczBJGK
	75WwqNdqE3E7XpRkTEzmGUo=
X-Google-Smtp-Source: ABdhPJwYfwEmgTdBP1XKGI80b6kqrz1XkdrBQ8t+DrrzZlxjSnBu/Poc+tt0nufpSNoZ/FetOrCSKg==
X-Received: by 2002:a2e:5cc1:0:b0:24b:112f:9b36 with SMTP id q184-20020a2e5cc1000000b0024b112f9b36mr20571695ljb.337.1652351099625;
        Thu, 12 May 2022 03:24:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1a20:b0:24f:4bdd:dc20 with SMTP id
 by32-20020a05651c1a2000b0024f4bdddc20ls865282ljb.5.gmail; Thu, 12 May 2022
 03:24:57 -0700 (PDT)
X-Received: by 2002:a2e:8395:0:b0:24f:f16:1fd2 with SMTP id x21-20020a2e8395000000b0024f0f161fd2mr20687605ljg.42.1652351097499;
        Thu, 12 May 2022 03:24:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652351097; cv=pass;
        d=google.com; s=arc-20160816;
        b=ACTbA8C16XYKD8BDlKYoIcuHPcrIdTIRHBs3ne5F8c9DUkTUx2Tle7B5J9xqFHGNcF
         nP3AZNj6puym4HxavUkok/0N/6CPhOAWuPDTwuBKOiXt6gNkYBI/+MFFmQWVIhIVSQqI
         u7217LeVB6nKD0riFPWVDeTRmBEM7EwPsrGqkzfTsW5m+TSY8xjbXEqh9rW1Osez3J8R
         1Oj+dP7/H+UWt5c5tkiad/b3w3pbZ4XW1dbsO4so+WvsFYel59YuD9XOJI3Te8M02eob
         f4IlL9rRu+R6jdUSoX8u+y2wmwQrDm+pIT8VgZJRDVxDvv79V0nyyadd5SB7DEqk03m+
         kO+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OcL6QMi9Qiq/blcZw0b2IxCopVpZQMkpey+G6xKS/w8=;
        b=Y3vxNx3oIe+lXVFCoWXT58czw7mve6S5d2CB18dtiAHMj4XmU3XZJZJrvF6QUJvn1F
         GK/6qp6TUS64GXwPcBqyJ7Q6quucS/pnSCHGfNn8bmuSSWrvrmq47uGbQjZVMBnOXGRb
         RKv4RwMtzLAnJ+IQq1aJ03feaNlDOqj8m4fjBnGMN7xs0B9bRbWP/tCENvSWEzxml4KB
         h8FXrsf+Ouiu7SLhatKgT/yZWATIHweMroUYG3DqmsGwcYU3U+WHIOI7GquadEz6W98z
         jSWku5gNvc6cQqZovPvXgg1LARJzcQ8m3XOu/oPpXnfNOOqqTLFkiIR7DzXUXZRDz1wu
         SXaA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=Vh+wet6v;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::627 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0627.outbound.protection.outlook.com. [2a01:111:f400:fe0c::627])
        by gmr-mx.google.com with ESMTPS id x8-20020a056512078800b00473a659879csi210888lfr.13.2022.05.12.03.24.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 May 2022 03:24:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::627 as permitted sender) client-ip=2a01:111:f400:fe0c::627;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4zDyWlTHRnw7jcivyIziA1xWYw1zGN/omEC1GhzG4S7nceo+qlgOsftTymK0BQV0pDV+K4V62DyvlJIjmpBGPI1su8dtEoaZs11N2jUx68jW/Fuvkbe1b/JPz58ydRstShi5P6UzArXim1e/qrpHufdq8OxKuX9dhMryYBmK1aCs1jvN7vzajckabJGzOWx5y+LS5nITZY9xkBvTnDZxQynMg65VMQuWZOSj3LuLsj3TaqExN72NyyzidYl7En8YtVYAnEgKuTAQvaBbI9UACD+1Anon3xDWS1QC4yGDCh20r4rY5MkhuvC2BI1fHhIqzLv7vzeZP80LDcIrOx3/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcL6QMi9Qiq/blcZw0b2IxCopVpZQMkpey+G6xKS/w8=;
 b=kT1KFYj6y8Mhr5srWlLfexccmM3t3yttPJ7UPx6dcOk/mW3XASQ0lAWjmK+oIyB7iF403EU7i9JSCKzR9DImdjwcp+puT4iBFmBtKJIjU5EnqZdEZlKNX+9n4FOVxVoPaQaKetHXRT9Fxwi2XvAqGwrCQgtXiBpGWE4lT7dHe4BAZCj/JoZRk0pDp5A/iB8Hfu66gDfV9ptKNVrr9vmM6og9/KIEkKhfAlVHLJ/Tjxvy2mgI/nvskC9PwFb7ygX4x8TlRLiuTTuiM7OwU0+vtvgaqY0OQPB/a1VnhvJdbAJYcUwclTr6LTTtVtMzJ2Dgk+kM8MscsXSok77YKcswaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from DB9PR02CA0018.eurprd02.prod.outlook.com (2603:10a6:10:1d9::23)
 by PR3PR10MB3836.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:48::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Thu, 12 May
 2022 10:24:56 +0000
Received: from DB5EUR01FT050.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::ca) by DB9PR02CA0018.outlook.office365.com
 (2603:10a6:10:1d9::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Thu, 12 May 2022 10:24:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.70) by
 DB5EUR01FT050.mail.protection.outlook.com (10.152.5.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 10:24:55 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 12 May 2022 12:24:45 +0200
Received: from [139.25.68.37] (139.25.68.37) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 12 May
 2022 12:24:45 +0200
Message-ID: <fe2e7e92-8530-9913-307f-85437412fd81@siemens.com>
Date: Thu, 12 May 2022 12:24:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Kernel panic on enabling root cell
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <f0853228-55dd-465b-8db1-01f6d3f26d8fn@googlegroups.com>
 <d22051fb-2c80-2d88-af8c-5f1ccdb69197@siemens.com>
 <CA+V-a8sQAYXHykiGqn8DD8=cL4fv4NcszvgFgza2gE3_MCyRmQ@mail.gmail.com>
 <37be2e7c-c1f4-c5b6-f200-8d1cc48e0ee5@siemens.com>
 <CA+V-a8t-wvud8MF0oyAsHBSUuVQrrkqSr9RWE2tQLCoOzuQikw@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CA+V-a8t-wvud8MF0oyAsHBSUuVQrrkqSr9RWE2tQLCoOzuQikw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.25.68.37]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--18.782400-8.000000
X-TMASE-MatchedRID: aGuL5piyGFo5QaOxwNGfvo9bHfxDWoib9c0SSBk6D85swYo64ufkVWOJ
	thub07SwY4zJvUjGrxXCaBA5v6nrh8jIZFqzzNvWr4vHsAGpVweGZc0nh03Q7R1kSRHxj+Z53V4
	UShoTXaf6srwzFJ/qAsP/La5NP1Jvc1CRDGuYa05ASosYQrlWjAcb6hGUQ2tTCL8RFER/j9Myyi
	+n+H050RCOwdkP3NVeYAX1zFjEwVo9LPdQhgZ/lh1GpI2Wh7mMa72LzVxTKQURW4LR41Fi8lSMd
	QR/r3EeR6RHdVK85hV2NlrEE6OjjT+q6H5pp3fffQrOflXxFuVpY+rDpJtqXuGECTbIgjb5sVwP
	MKjZm1aKXNybanokTxc7TE9SuU5smvSD3/eM+8LTIDCR7KoHhIy3ARqB9bsbB89GKHo03nbDvsJ
	EJ3LgvOnYh8o5mXik/0etkVHtq//Z1ljEnEl+lmuxrifqNUT0ow4hEfm7GwyEv01fZOqaQPNkoM
	DX+kiuBCzD0Dc8iUv/jVm4Ro/FDrenr9gWkU6qcLDb3S7zoT2V76rqTtD9zC/MuWzsdN8ZfS0Ip
	2eEHny+qryzYw2E8LLn+0Vm71Lcq7rFUcuGp/EgBwKKRHe+r/FbeU0R/TdHH8Xjn61MsdMfhDFH
	bj6cpmTQ3Mhc3GVy7u0tDMnU+7A=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.782400-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 4DDB0B1B5CDBF07F28BA49827201DE217110761F207CC54CBE2FD0831BF4033D2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e737666-a9b1-4da1-bddf-08da3401a8e6
X-MS-TrafficTypeDiagnostic: PR3PR10MB3836:EE_
X-Microsoft-Antispam-PRVS: <PR3PR10MB3836CB32C68D18C47941C3E495CB9@PR3PR10MB3836.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ONdGcd6p+ahpaICKJH0jqX3yf0ePapgE6L2Le2XlIe+AuMevRAhIeXCLNyC6bnOEWqCxHE1Twm45JmOqoEI0cEQA0GCftqVWi0r38vrn8xI0iTlTaH9rmZE/71TlJd6DQjEgmSNHo8T06gpSEJBoLLVsqy70lphN011g5KDzpU6ogD2fWnGg5nJtyPws6GKbaDdPWqaZxrVTYQkkwB0iHpBKh+W3/9Hz7eQRlTre439pFJTJBCnYl3z29igOYqZ4vsF0c8T9jcap0yz6PlSzfDYfig1CExcbH+mDvRmj1z8jgD1FwhNZ79Gs5rvg5e7H7dbuejoMXj13oGhVaddoSH8SrWV4LiqAWeu8MJ0hTFzTO7twYFCM9l0+W6UqDX7Gygpqy3NlqNPNiiATwjTfZ9GldlWR7u92x/LoPMyCGGdhSwn0n7OzYt/E2QeNai1dyM7Pgr5I6mWQDQFLSQnyvT3R+ot/bEFUaLVHJXDijgDmaRht4EBdUSYpiSu16oeinlCRS5W8ZGpL2+ZeLpw9GnlrjTmsAVyAg6xAkiVAeg9MLKKi0mKz882K9vcaBPr6wQjz+t3EhNsdrPwUObJzdTb82jJCgNXnVgCYbM0/h2Rsrw3CcA+A+Wj7eKFmARbQCgooFwRYwjW6kRa2uzywXn1NSYKVJN2gKfydbLmjAwOZnoTBdtZI4nZ1H3NppF4urYTq3Minuk6Ug82QR9fexAfcdeWVKoASxmCIVAK3ZqdWOa25QAmGjH/KhzoqDANF
X-Forefront-Antispam-Report: CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(36860700001)(508600001)(40460700003)(8936002)(336012)(36756003)(31686004)(53546011)(356005)(6706004)(316002)(26005)(7636003)(7596003)(6916009)(82960400001)(16576012)(2616005)(5660300002)(956004)(86362001)(31696002)(8676002)(4326008)(70206006)(70586007)(44832011)(47076005)(186003)(16526019)(82310400005)(2906002)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 10:24:55.8871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e737666-a9b1-4da1-bddf-08da3401a8e6
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT050.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3836
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=Vh+wet6v;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe0c::627 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 12.05.22 09:01, Lad, Prabhakar wrote:
> Hi Jan,
> 
> On Thu, May 12, 2022 at 6:45 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 11.05.22 19:09, Lad, Prabhakar wrote:
>>> Hi Jan,
>>>
>>> On Wed, May 11, 2022 at 4:11 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>
>>>> On 11.05.22 13:20, Prabhakar Lad wrote:
>>>>> To add further more details:
>>>>>
>>>>> I am using jailhouse-enabling/5.10 Linux branch [0] with -next branch
>>>>> for jailhouse [1].
>>>>>
>>>>> I added some debug prints and I see the panic is caused when entry()
>>>>> function is called (in enter_hypervisor). The entry function lands into
>>>>> assembly code (entry.S). I dont have a JTAG to see which exact
>>>>> instruction is causing this issue.
>>>>
>>>> So, already the first instruction in the loaded hypervisor binary is not
>>>> executable? That would explain why we see no hypervisor output at all.
>>>>
>>> To clarify when the hypervisor is loaded the output will be via
>>> debug_console specified in the root cell config?
>>>
>>
>> Correct - if you reach entry() in setup.c.
>>
>>>> Was that memory region properly reserved from Linux (via DTB carve-out
>>>> e.g.)?
>>>>
>>> Yes I have the below memory reserved in my dts:
>>>
>>>     memory@48000000 {
>>>         device_type = "memory";
>>>         /* first 128MB is reserved for secure area. */
>>>         reg = <0x0 0x48000000 0x0 0x78000000>;
>>>     };
>>>
>>>     reserved-memory {
>>>         #address-cells = <2>;
>>>         #size-cells = <2>;
>>>         ranges;
>>>
>>>         jh_inmate@a7f00000 {
>>>             status = "okay";
>>>             no-map;
>>>             reg = <0x00 0xa7f00000 0x00 0xf000000>;
>>>         };
>>>
>>>         jailhouse: jailhouse@b6f00000 {
>>>             status = "okay";
>>>             reg = <0x0 0xb6f00000 0x0 0x1000000>;
>>>             no-map;
>>>         };
>>>     };
>>>
>>> Linux does report the hole in RAM:
>>>
>>> root@smarc-rzg2l:~# cat /proc/iomem  |  grep RAM
>>> 48000000-a7efffff : System RAM
>>> b7f00000-bfffffff : System RAM
>>>
>>> And below is my root cell config related to hypervisor memory:
>>>
>>>         .hypervisor_memory = {
>>>             .phys_start = 0xb6f00000,
>>>             .size =       0x1000000,
>>>         },
>>>
>>> Is there anything obvious I have missed above?
>>>
>>
>> Nothing obvious to me so far.
>>
>> So, is this really the first instruction in
>> hypervisor/arch/arm64/entry.S, arch_entry, that triggers the undefinstr?
>> Check the reported address by Linux against the disassembly of the
>> hypervisor. You could also play with adding 'ret' as first instruction,
>> to check if that returns without a crash.
>>
> I did play around with ret, below is my observation:
> 
> Up until line 98 [0] just before calling arm_dcaches_flush adding ret
> returned without a crash. Adding a ret at line 99 [1] ie after
> arm_dcaches_flush it never returned.
> 
> So I continued with adding ret in  arm_dcaches_flush, I added ret as a
> first statement in arm_dcaches_flush and was able to see the panic!

Which Jailhouse revision are you building? Already disassembled 
hypervisor.o around arch_entry and arm_dcaches_flush? This is what I 
have here for next:

0000ffffc0203efc <arm_dcaches_flush>:
    ffffc0203efc:       d53b0024        mrs     x4, ctr_el0
    ffffc0203f00:       d3504c84        ubfx    x4, x4, #16, #4
    ...

0000ffffc0204800 <arch_entry>:
    ffffc0204800:       aa0003f0        mov     x16, x0
    ffffc0204804:       aa1e03f1        mov     x17, x30
    ...
    ffffc0204844:       d2800042        mov     x2, #0x2                        // #2
    ffffc0204848:       97fffdad        bl      ffffc0203efc <arm_dcaches_flush>

You could check if there is such a relative call in your case as well.
Then you could check, before jumping into arch_entry from the 
hypervisor, that the opcode at the actual arm_dcaches_flush address is 
as expected. But maybe already the building injects an issue here.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fe2e7e92-8530-9913-307f-85437412fd81%40siemens.com.
