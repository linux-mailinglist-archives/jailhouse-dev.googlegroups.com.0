Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRHQ7CJQMGQEXMC7IHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13b.google.com (mail-il1-x13b.google.com [IPv6:2607:f8b0:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id C72DB52602F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 May 2022 12:51:52 +0200 (CEST)
Received: by mail-il1-x13b.google.com with SMTP id l8-20020a056e021aa800b002cf778c63casf4943174ilv.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 13 May 2022 03:51:52 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1652439110; cv=pass;
        d=google.com; s=arc-20160816;
        b=LsdIEPgpmHYTjUQTPROCX6Z53m+rHrpFGjP1nsiv/vXUIn5HUafXwYYCyfdu3MwwYm
         TAYhnDhI7wfSkwfkwIdXwjRpGYNmWgjM0jId8Esu1Q3NQQsGQrfRuSx/wONfDR+SRSob
         Qx2CDN+Co82fHLVn5CFD6h69XfQHuYJRYYy/3DzEKF2NAd/gYtZiLT7XjkGrs7v2+s6i
         g1lt4TZiSvgtDhVvO4KjG0f0ymwMLwlgkMgrpY/CRQVMEHA1Kb/1qb3UJiPBqXll3JF7
         EAFKcqtCzgDIHrsiMOajiZX/OOcFmvS/whkXLAIbqL0mcidcjTDvASTNAH9gwYN+ROqu
         COsw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=IBYbUR8f0qvw7pfOOaRonZF2LhXN2IaYNQSJlUJjocA=;
        b=eUWSPEdhFRKzCIOm2phDIS3oSzPCC8k3qsDZT2zq/7srxWmb2pwdEXdZ9adjXleFkd
         I3TJ0g7mhEM3YZHgYlPdvk4EbIolCxc1vCHePa0RmjF8PvSusXxqyK3gr9BWQr+O5rdH
         w/GG6bN5DcRZU8tMfFDGQHzGaG+FG6gsOgskQu79K3ZGwqdxGkZycHHSXuK3DarUwrVs
         +SevP9gJ2VbAs95qaTGX/jxR7mj3jfwd3taPFTI+a2Pc5CmixeKsK3iIiu+D03+7rd1Y
         hkGFNc8IejrdJNOBsKKLdsPhtmLyOjGy6GmLHcNjfqY/bRKDG8PLwN+YpxhsTYIE/3z0
         hFbg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=SQmzKp0V;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe05::62c as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IBYbUR8f0qvw7pfOOaRonZF2LhXN2IaYNQSJlUJjocA=;
        b=Z+fbgMFavqRRow1EiA7rsq7Me+w3s6tY3pQF8HQyCXA3dHUU3VDMDH9R9gwBhbI3oi
         E5z3mOK/Ir+uqqwDFHZwPIstDb5/WSf0s9N8IIQyAgDU1EtJ5gRmXtsj9k1ptYwbCs6b
         x+MuIYkxCwBNIgH38ZHeSpznyn7vKM9mictC5HAdLGVy0O66v3rXgXqOJ57lmWzrZUr3
         +ZW/l07rXdSMIWmluxUX4zvcxAW+uYswwwXK9I0rCneZ3/W6zcaVPPa9zzuERL1NtBdR
         jkQxhdpBtEMYHuyq60iXoV66vM5oObhGEDcvDJxJq67pfyv7K4g4HH5ibsCCtaxj0kkU
         0eJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=IBYbUR8f0qvw7pfOOaRonZF2LhXN2IaYNQSJlUJjocA=;
        b=5FUbgOKC81VL5EkEEpqzz9iO7c8ql886/Sq7ttuQRXHX5xVWrxlkhQbC2FhPGcc910
         M5EyiMX+fUPAVk0bf8eVc0WUcrn9ZAFMxBYLiK5fKZ0m6cOXUvGgSA1AbmyxrbApx4kg
         yDv7VZWeXeCXUt/KUzSNMsAQrmXbWPsd83wTVvWr8SwAuoBrPiiPcI59yrXl/e4mGgNm
         u9lUAx8YO4Djl/WvVZzetp+t5xTH7y5dN3qJKBVqR8HcLQ4dO2S+xcBSNFc7aqweeOyr
         67mHybEc8N3VNsnXPzxxWR9NcXpw4qu0jVpvDZgH40qkBDGdj4/sPjMgUnrPnQ5nMPGC
         1YdQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533+wFACK0/Mz2ohegNbLQ7vyucOXNSEsyKIjon6KBb6MvMAxgke
	FJmUqCEEqjwOXy82qCtlbDg=
X-Google-Smtp-Source: ABdhPJzYTYmcVNZRiCoKgN+2rWAgtMao30dsIVVwpkqRvBL0+ePUiSVnqAXxya77Pae2DC5vNwSS4A==
X-Received: by 2002:a02:a604:0:b0:32b:ef73:110f with SMTP id c4-20020a02a604000000b0032bef73110fmr2218226jam.316.1652439108519;
        Fri, 13 May 2022 03:51:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6638:130c:b0:32b:8cba:d72d with SMTP id
 r12-20020a056638130c00b0032b8cbad72dls1512609jad.5.gmail; Fri, 13 May 2022
 03:51:47 -0700 (PDT)
X-Received: by 2002:a05:6638:1486:b0:32b:e870:b2a7 with SMTP id j6-20020a056638148600b0032be870b2a7mr2220666jak.200.1652439107692;
        Fri, 13 May 2022 03:51:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652439107; cv=pass;
        d=google.com; s=arc-20160816;
        b=XeymYoE7tjvfQBh+5oMXUXdog1mEywgJQ/ToCs1+R0rTCg9EyxiBe+l1mqMlIUuK49
         gBQOJgOUvW9HaBYsxpvWJCujfo+nKSaS3gFzD9BrRvsPpV1EPlJbSmG3EmaJN0pQ1pvT
         VIm8dUIBA9KHnTBKz6XUc2YDc6aw2hfTh75stgQksgdvDvb28/A4Gbj3vHcYIN6FTP9O
         Ab0PyDnw/vHa7tl0K/7vPG3KI5UJJ6yncN1imCTJyjC5q69UXcaELr/ypqvtKNDFU/OX
         Ge8NchmSFJW/DBtwbiIeeY+xl4DUJYlYq83yVlb9T5A1cjDa6vyKxNXPpRvtAO4flnAm
         DsIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=RJr+E7VRI/25jiZheXCd1h5quz5ULn+QcvBAMr2J2pM=;
        b=M/yufcABn4mimqmT6y92/0TQEb4jDaj5zeoPk1ErEQqaEDMHQDXynTynyzsSarObju
         hFulbjFT1hmk2OIXo2T5h8+RgZZcELfHpP5URqvlQGkxgJTe5vl5PodAUCzeu8Q/q/D+
         YyyY5zYfx17DxYdFUyetpcg8UFHo3i4qhQQAN798CQ7g+8om8g2gE1sUILWqG9/sqGw6
         8WGddgBmbTQ0rBKIj76A4DZWIAV9RS53w4mlAUECX4SLNToDlzRQnekZYJBPEE46IvRe
         GLqBtAIX4yLpusYQ1qw5fp/QMUQNQJN1bjIZkmbkYeWPkhMpjmLugy0CB0aNpt3MUicV
         9z9g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=SQmzKp0V;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe05::62c as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-he1eur02on062c.outbound.protection.outlook.com. [2a01:111:f400:fe05::62c])
        by gmr-mx.google.com with ESMTPS id j8-20020a92ca08000000b002ca3e929b6csi191163ils.2.2022.05.13.03.51.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 May 2022 03:51:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe05::62c as permitted sender) client-ip=2a01:111:f400:fe05::62c;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBDc6f+FF19uZ66E27xRxrfxa5jixdLpPQf7Vp/Kd7GfxwAEPl/nzhZLSnMpfdyom9EmKYcpBpp3DELT+3iLbXC+v0mvVCeVKZ2ieFASOBRot7r7eVHJan6ORVo6+XF48WsxQhDGJeqpG/kJUslVp1BAb9/buEsxM6IsKv2qS66Kt/O7uwfHq07iHkqacvwTu2Cc041KFA9mmQGJM1qbpm9+ZMFfY3+5OMwT4VkGpf13OogZfQWtQE1R/cYFi2K5nAbUkwqV0TAGi7P0fa3RQpWmMYaLwnYt6DEK4pl10o12gKzilkkWVtG4KlI3Xxp35wiFL1FZ6szkeO55GA1yrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJr+E7VRI/25jiZheXCd1h5quz5ULn+QcvBAMr2J2pM=;
 b=ZPkdwSO8BscrcWoPchZwv19wo9WPhQTijveukW/cliscID167af+BUoxWBw2jLGKcECEj7MezAorHbQbL8CHwf7PutqTb9RgT42qrjRTFQsXe70tvOdHbaw+UGp0DIzulDeKmyiEAp7cBVqfNFybKP28N/6iU6PDapEhjfRyoiBxBC4GOvb81qqGTqvNqSys/LvOX/tYmG4c6UJlFf3KPhQbio/GA86AcLU1uN/OoGdqhKsszeb4K5sc530L8T3eFwcVnoW0Y7GfvK/aMHrAqBhaEdKJZp+2z/h8TnuFzqlKCVw3lf776LPXfaiIDJYaCmHUwmp3vvI8H2yqLwtOzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from AS9PR06CA0568.eurprd06.prod.outlook.com (2603:10a6:20b:485::30)
 by DB7PR10MB2394.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Fri, 13 May
 2022 10:51:44 +0000
Received: from VE1EUR01FT056.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:485:cafe::63) by AS9PR06CA0568.outlook.office365.com
 (2603:10a6:20b:485::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Fri, 13 May 2022 10:51:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 VE1EUR01FT056.mail.protection.outlook.com (10.152.3.115) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Fri, 13 May 2022 10:51:43 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 13 May 2022 12:51:43 +0200
Received: from [139.22.104.221] (139.22.104.221) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 13 May 2022 12:51:43 +0200
Message-ID: <2fe4d998-1784-53c5-a653-994882ec7fb6@siemens.com>
Date: Fri, 13 May 2022 12:51:42 +0200
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
 <fe2e7e92-8530-9913-307f-85437412fd81@siemens.com>
 <CA+V-a8sgPXsMmsKYwE6etP=JG8Ef83Qz4RHoWAZKeHdVHhk_Pw@mail.gmail.com>
 <5ea8c025-13f2-4754-479a-21395de9306d@siemens.com>
 <CA+V-a8tM_umwZ-+vt7VST1pBJF2MxmbOJSonzDDbJz_OV=GE3w@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CA+V-a8tM_umwZ-+vt7VST1pBJF2MxmbOJSonzDDbJz_OV=GE3w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.22.104.221]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--18.596600-8.000000
X-TMASE-MatchedRID: grK+ChACArw5QaOxwNGfvo9bHfxDWoib9c0SSBk6D85swYo64ufkVWOJ
	thub07SwY4zJvUjGrxXCaBA5v6nrh8jIZFqzzNvWr4vHsAGpVweGZc0nh03Q7R1kSRHxj+Z53V4
	UShoTXaf6srwzFJ/qAsP/La5NP1Jvc1CRDGuYa05ASosYQrlWjAcb6hGUQ2tTCL8RFER/j9Myyi
	+n+H050RCOwdkP3NVeYAX1zFjEwVo9LPdQhgZ/lh1GpI2Wh7mMa72LzVxTKQURW4LR41Fi8lSMd
	QR/r3EeR6RHdVK85hV2NlrEE6OjjT+q6H5pp3fffQrOflXxFuVpY+rDpJtqXuGECTbIgjb5sVwP
	MKjZm1aKXNybanokTxc7TE9SuU5smvSD3/eM+8LTIDCR7KoHhIy3ARqB9bsbB89GKHo03nbDvsJ
	EJ3LgvOnYh8o5mXik/0etkVHtq/8aUiTYmfzyKd3ZNwOPBqrYAM0/G7XUdeOEsxw9kf3dvEYj0z
	DHPzJp3unRG7yMq8UQyMOxzPzlhV2xMFrvDMyRwsZhPVDrsSPm0GdS2zsXWJUXYcPwQc2nLPSJu
	5jov2bWXfwzppZ8SOK5fhRxt1aAA41sIOnMj8YdFnFuhtKX0KGnquim0WHzpyEWs4H2RqcP6OWz
	RxLAk7Zk7gsuflVKvK0M8RWx8ZT3mzd9ajBAw0xuauhSu97OIT4OE4LRLV5UBkW/Tibe5Opppbh
	uVjnzV4i674aSi3ybAPxtNvAfmGMJRJ1WGnFogoYjLp9hKaAxs7ulGdJ/volSWYvdSPSYLozI+r
	hNYbm2zFWqrVN4BV43rBTndKTO4vM1YF6AJbZFi+KwZZttL7ew1twePJJBrSFs54Y4wbX6C0ePs
	7A07Q9dk+6tnSFL/yXanK8KzcSjiazHl0YIGyPE6qVCBBh00YTVS3s/zuM=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.596600-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 7567A165802BE2624A265F9BAC72F3B76523DE1E124E9C2D9EF5FF325C0CA0FD2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4d6cc9c-9238-4792-7a71-08da34ce91c2
X-MS-TrafficTypeDiagnostic: DB7PR10MB2394:EE_
X-Microsoft-Antispam-PRVS: <DB7PR10MB2394C02346230C0015ADB95895CA9@DB7PR10MB2394.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7D5W0HZUoNR5hUwdFtrxyXI8uo9rvR7mdfGuyNrdloUa1ug5BmPJdJlgPs2VK6Rr0TiTq8lADc9mplKOOuVxoYXCdcMbWBengZVOKNwThKEHjZA9Ikq+djs5SjqvIN0uASasDLjB9jAtUv83AYIDYQs4e2D1Bh+vCk3uMx6UDzR762K9mKHMhBWeQBZn4ywVjXg3l+H6JA0VLCjZPSr5XH7GHppqVoZwP2r5JbWDpWR2FoAmN4p8nTmJZK0YWrKGK8+AIjaFiuYw4ryNjes7FEGNEd6hbf2ylUUWXT8+SjN2LQ1Z5GXqDaKzhNA6LrsT6s9dRp61Zav5cKH/vcfP5rmrUaP8KXOPRci4+N9m7hJtauIXLc8UKtMzWosbZfr2KsgdxXvZo6QznBE24UAUeGp4JBpfsBzZHd7cgJ4V9p4ewGS2szkvcolGG1Bo/IJTNDQk4Ka3sDBZX3hP2JNdmzlYHRqMFuO+EjotNeElk8ogJKYf6a/piRxHC5ICeIDxXTPrfSn9+wjE8KM0i+56AKFAVm6sztzo3RZqb7UQ4Yht3Gc9EAggM0UNibCZkAYTWDTzEspyJ1HdopCKYXCp5Tz5eD8iRRvSQx/bpnVj4AIh82lZAfKL4jJcnCR+5h/mhbh2SIK6vzIQHalAoCldNC3+iGMbxHvSPzcOP8jItjLX/o7btyRKcKEzdyVn5ASXIi8uuIAjhaPqvS1em7WaWW89hLqXY5j3WHQ2D80qMfkfSQRPNOUdXBCdfacjULs/CEAmxK7nVGJJXw4iKEP6Ow==
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(70586007)(16576012)(16526019)(316002)(8676002)(81166007)(4326008)(44832011)(31686004)(508600001)(356005)(70206006)(5660300002)(186003)(6916009)(2616005)(956004)(6706004)(36756003)(82310400005)(31696002)(8936002)(47076005)(26005)(2906002)(83380400001)(40460700003)(82960400001)(53546011)(36860700001)(86362001)(336012)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 10:51:43.9226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d6cc9c-9238-4792-7a71-08da34ce91c2
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT056.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB2394
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=SQmzKp0V;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe05::62c as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 12.05.22 13:37, Lad, Prabhakar wrote:
> Hi Jan,
> 
> On Thu, May 12, 2022 at 12:16 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 12.05.22 13:06, Lad, Prabhakar wrote:
>>> Hi Jan,
>>>
>>> On Thu, May 12, 2022 at 11:24 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>
>>>> On 12.05.22 09:01, Lad, Prabhakar wrote:
>>>>> Hi Jan,
>>>>>
>>>>> On Thu, May 12, 2022 at 6:45 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>
>>>>>> On 11.05.22 19:09, Lad, Prabhakar wrote:
>>>>>>> Hi Jan,
>>>>>>>
>>>>>>> On Wed, May 11, 2022 at 4:11 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>>>
>>>>>>>> On 11.05.22 13:20, Prabhakar Lad wrote:
>>>>>>>>> To add further more details:
>>>>>>>>>
>>>>>>>>> I am using jailhouse-enabling/5.10 Linux branch [0] with -next branch
>>>>>>>>> for jailhouse [1].
>>>>>>>>>
>>>>>>>>> I added some debug prints and I see the panic is caused when entry()
>>>>>>>>> function is called (in enter_hypervisor). The entry function lands into
>>>>>>>>> assembly code (entry.S). I dont have a JTAG to see which exact
>>>>>>>>> instruction is causing this issue.
>>>>>>>>
>>>>>>>> So, already the first instruction in the loaded hypervisor binary is not
>>>>>>>> executable? That would explain why we see no hypervisor output at all.
>>>>>>>>
>>>>>>> To clarify when the hypervisor is loaded the output will be via
>>>>>>> debug_console specified in the root cell config?
>>>>>>>
>>>>>>
>>>>>> Correct - if you reach entry() in setup.c.
>>>>>>
>>>>>>>> Was that memory region properly reserved from Linux (via DTB carve-out
>>>>>>>> e.g.)?
>>>>>>>>
>>>>>>> Yes I have the below memory reserved in my dts:
>>>>>>>
>>>>>>>     memory@48000000 {
>>>>>>>         device_type = "memory";
>>>>>>>         /* first 128MB is reserved for secure area. */
>>>>>>>         reg = <0x0 0x48000000 0x0 0x78000000>;
>>>>>>>     };
>>>>>>>
>>>>>>>     reserved-memory {
>>>>>>>         #address-cells = <2>;
>>>>>>>         #size-cells = <2>;
>>>>>>>         ranges;
>>>>>>>
>>>>>>>         jh_inmate@a7f00000 {
>>>>>>>             status = "okay";
>>>>>>>             no-map;
>>>>>>>             reg = <0x00 0xa7f00000 0x00 0xf000000>;
>>>>>>>         };
>>>>>>>
>>>>>>>         jailhouse: jailhouse@b6f00000 {
>>>>>>>             status = "okay";
>>>>>>>             reg = <0x0 0xb6f00000 0x0 0x1000000>;
>>>>>>>             no-map;
>>>>>>>         };
>>>>>>>     };
>>>>>>>
>>>>>>> Linux does report the hole in RAM:
>>>>>>>
>>>>>>> root@smarc-rzg2l:~# cat /proc/iomem  |  grep RAM
>>>>>>> 48000000-a7efffff : System RAM
>>>>>>> b7f00000-bfffffff : System RAM
>>>>>>>
>>>>>>> And below is my root cell config related to hypervisor memory:
>>>>>>>
>>>>>>>         .hypervisor_memory = {
>>>>>>>             .phys_start = 0xb6f00000,
>>>>>>>             .size =       0x1000000,
>>>>>>>         },
>>>>>>>
>>>>>>> Is there anything obvious I have missed above?
>>>>>>>
>>>>>>
>>>>>> Nothing obvious to me so far.
>>>>>>
>>>>>> So, is this really the first instruction in
>>>>>> hypervisor/arch/arm64/entry.S, arch_entry, that triggers the undefinstr?
>>>>>> Check the reported address by Linux against the disassembly of the
>>>>>> hypervisor. You could also play with adding 'ret' as first instruction,
>>>>>> to check if that returns without a crash.
>>>>>>
>>>>> I did play around with ret, below is my observation:
>>>>>
>>>>> Up until line 98 [0] just before calling arm_dcaches_flush adding ret
>>>>> returned without a crash. Adding a ret at line 99 [1] ie after
>>>>> arm_dcaches_flush it never returned.
>>>>>
>>>>> So I continued with adding ret in  arm_dcaches_flush, I added ret as a
>>>>> first statement in arm_dcaches_flush and was able to see the panic!
>>>>
>>>> Which Jailhouse revision are you building? Already disassembled
>>>> hypervisor.o around arch_entry and arm_dcaches_flush? This is what I
>>>> have here for next:
>>>>
>>> I'm using the next branch too.
>>>
>>>> 0000ffffc0203efc <arm_dcaches_flush>:
>>>>     ffffc0203efc:       d53b0024        mrs     x4, ctr_el0
>>>>     ffffc0203f00:       d3504c84        ubfx    x4, x4, #16, #4
>>>>     ...
>>>>
>>>> 0000ffffc0204800 <arch_entry>:
>>>>     ffffc0204800:       aa0003f0        mov     x16, x0
>>>>     ffffc0204804:       aa1e03f1        mov     x17, x30
>>>>     ...
>>>>     ffffc0204844:       d2800042        mov     x2, #0x2                        // #2
>>>>     ffffc0204848:       97fffdad        bl      ffffc0203efc <arm_dcaches_flush>
>>>>
>>>> You could check if there is such a relative call in your case as well.
>>> yes it does exist, below is the snippet:
>>>
>>> 0000ffffc0204000 <arch_entry>:
>>>     ffffc0204000:    aa0003f0     mov    x16, x0
>>>     ffffc0204004:    aa1e03f1     mov    x17, x30
>>>     ffffc0204008:    10fdffc0     adr    x0, ffffc0200000 <hypervisor_header>
>>>     ffffc020400c:    f9402412     ldr    x18, [x0, #72]
>>>     ffffc0204010:    5800fd0f     ldr    x15, ffffc0205fb0 <sdei_handler+0x2c>
>>>     ffffc0204014:    900000e1     adrp    x1, ffffc0220000 <__page_pool>
>>>     ffffc0204018:    79406002     ldrh    w2, [x0, #48]
>>>     ffffc020401c:    d2880003     mov    x3, #0x4000
>>>  // #16384
>>>     ffffc0204020:    9b030441     madd    x1, x2, x3, x1
>>>     ffffc0204024:    f842c02e     ldur    x14, [x1, #44]
>>>     ffffc0204028:    5800fc8d     ldr    x13, ffffc0205fb8 <sdei_handler+0x34>
>>>     ffffc020402c:    f840c02c     ldur    x12, [x1, #12]
>>>     ffffc0204030:    cb0d018b     sub    x11, x12, x13
>>>     ffffc0204034:    924051c1     and    x1, x14, #0x1fffff
>>>     ffffc0204038:    8b0101ef     add    x15, x15, x1
>>>     ffffc020403c:    f9001c0f     str    x15, [x0, #56]
>>>     ffffc0204040:    f9400401     ldr    x1, [x0, #8]
>>>     ffffc0204044:    d2800042     mov    x2, #0x2                       // #2
>>>     ffffc0204048:    97ffff6c     bl    ffffc0203df8 <arm_dcaches_flush>
>>>     ffffc020404c:    5800fba1     ldr    x1, ffffc0205fc0 <sdei_handler+0x3c>
>>>     ffffc0204050:    8b0b0021     add    x1, x1, x11
>>>     ffffc0204054:    d2800000     mov    x0, #0x0                       // #0
>>>     ffffc0204058:    f100025f     cmp    x18, #0x0
>>>     ffffc020405c:    54000041     b.ne    ffffc0204064
>>> <arch_entry+0x64>  // b.any
>>>     ffffc0204060:    d2800020     mov    x0, #0x1                       // #1
>>>     ffffc0204064:    d4000002     hvc    #0x0
>>>     ffffc0204068:    d4000002     hvc    #0x0
>>>     ffffc020406c:    14000000     b    ffffc020406c <arch_entry+0x6c>
>>>
>>>> Then you could check, before jumping into arch_entry from the
>>>> hypervisor, that the opcode at the actual arm_dcaches_flush address is
>>>> as expected. But maybe already the building injects an issue here.
>>>>
>>> Any pointers on how I could do that?
>>>
>>
>> arm_dcaches_flush is loaded at arch_entry (header->entry +
>> hypervisor_mem) - 0x208. Read the u32 at that address and check if it is
>> what is in your hypervisor.o (likely also d53b0024).
>>
>> If that is the case, not the jump but that "mrs     x4, ctr_el0" may
>> actually be the problem. Check out hypervisor/arch/arm64/caches.S and
>> see if that code, specifically dcache_line_size, causes trouble outside
>> of Jailhouse as well, maybe as inline assembly in the driver module.
>>
> 
> With the below ret added, I get "JAILHOUSE_ENABLE: Success"
> 
> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
> index a9cabf7f..4e98b292 100644
> --- a/hypervisor/arch/arm64/entry.S
> +++ b/hypervisor/arch/arm64/entry.S
> @@ -96,6 +96,7 @@ arch_entry:
>          */
>         ldr     x1, [x0, #HEADER_CORE_SIZE]
>         mov     x2, DCACHE_CLEAN_AND_INVALIDATE_ASM
> +       ret
>         bl      arm_dcaches_flush
> 
>         /* install bootstrap_vectors */
> 
> Now when I undo the above and do the below, Im seeing a panic:
> 
> diff --git a/hypervisor/arch/arm64/caches.S b/hypervisor/arch/arm64/caches.S
> index 39dad4af..ce29b8e8 100644
> --- a/hypervisor/arch/arm64/caches.S
> +++ b/hypervisor/arch/arm64/caches.S
> @@ -40,6 +40,7 @@
>   */
>         .global arm_dcaches_flush
>  arm_dcaches_flush:
> +       ret
>         dcache_line_size x3, x4
>         add     x1, x0, x1
>         sub     x4, x3, #1
> 
> Issue is seen even without dcache_line_size being called. Does that
> mean we are not landing in arm_dcaches_flush?
> 

Wait! This last "ret" will make you go back to arch_entry only, not to
the caller of arch_entry. Furthermore, x30/lr is after "bl
arm_dcaches_flush" no longer pointing to the caller of arch_entry. That
value is saved into x17.

Could it be that arm_dcaches_flush was a red herring? Maybe we are
actually crashing on hvc in arch_entry, and that because of Linux not
starting in HVC mode, thus no hypervisor take-over stub being installed.

Could you share the boot log of the kernel?

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2fe4d998-1784-53c5-a653-994882ec7fb6%40siemens.com.
