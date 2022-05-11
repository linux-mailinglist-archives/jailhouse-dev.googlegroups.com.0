Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBY5F56JQMGQEWIW4LPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5465236D8
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 May 2022 17:14:45 +0200 (CEST)
Received: by mail-ej1-x63a.google.com with SMTP id p7-20020a170906614700b006f87f866117sf1311298ejl.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 May 2022 08:14:45 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1652282085; cv=pass;
        d=google.com; s=arc-20160816;
        b=Zwx59JbG7nP76Tdm0sxfNAX7sSF7rhBGRjQ20SGhAQa9UxaCx44o9SLo4OJzfLi9dC
         l80xKdwqhNl8x/8kEZjPO6I0PTYFCZuPJ4sPXMDv9phWB+LqgDzKBKIteen/LZEP4euh
         v5XZg2Ic0aCFuhbp0asfDk4ThPX4tn8WEm860JOuXQDmpubXb/U5qtQnDCYTCxHCVifc
         Vbe/9cGlQwtJ47E52p8pUQMkmZntYbGW24UtNkvRf8yE+APvCmgQCK3L0xBK7mLZE442
         DP8ERR/QqgLiucsaySBVgcZ3AgG9g/YopLCb38TjqtPsGt2/B13JDbyLcSXo56dXnWxB
         20UA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=dYlax9RKYoGzuy/V57uefVpo0HfiBfztJDI0rfeCVSI=;
        b=gfttjppqXQqAhOOwDpvZgwKTyUjdiQkiZ8wZBJNvzAhQ8SufBd66gh3hIxtYpqwkm3
         6t2DvInzrr4P9xtOUhmf9b/5VdLi7Zxp56IrX09vU+h+tw4yIHgpgl4cGjZkZvHiW1cH
         xTh3XKX37nnCHxoT57BtVoOgXp0KiiBqPElZZyKdvDMiiDubpMzYgoKWIiMW5oA1ExId
         EU4O1WyxhGdYIGOGz9iiHSvDNJd8dnclMjiRa6TGKzUD0znG2ghcjbQCtTLYF4p7dHO3
         daB/wZHwl4Z25JSEFKpNYBv85VZSq2cyuUh6KQPv38yiFhNU7ZVxnbhdkHDKKPR+X0J8
         uZWQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=hJIP5Sn6;
       arc=pass (i=1);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe1f::616 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dYlax9RKYoGzuy/V57uefVpo0HfiBfztJDI0rfeCVSI=;
        b=eSumFjSkXQRaoXhK/4qXGf1++C1+sJkqcglVO+PD1q9AhvosKbvRzeh1ztouIOEsv1
         z2vBQLk4AyWV3xvVqklGOE3ats836GDah4DFIIBOAGe5rGygV6sKk6lalm4BNTkb7+ls
         aMd0qpK3Co4/Q6Rz3J+mODPvDKkn4YyPixe84RkYUcZdfZnaHwNf+tjd4eXxkpz5W2ys
         hzLzgSCmTgtnKZGd8dly+KXcRkKVcu5u1f8I6objh3zURcMyXc4RBaWzl2oARYWEGavq
         Oqm8MAeDcNX+YuWniih89h1ZQIU7D3j4A6/ZR1Hfor0PVk1eeIrSQt7tUGE11v9T8Q3k
         I7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dYlax9RKYoGzuy/V57uefVpo0HfiBfztJDI0rfeCVSI=;
        b=KJuLumFevYPrXLuUyZyWKIE5FgZ91QLXwdynXPNOvjoxEK7q2MvQU0VY9WUPhrHkV/
         xbeVZr4rn2zHw9EYiSOgnDW5u/n0DHH1DvGbJcynKcunsuibf4Bwcih5Fjg4H8CwHe8x
         slHFLOnBqIM6f4bAGB4b6KduWWdP18ULB9SQfPjlRWrg18RWM29dAgV0oj4I8qVa0rgd
         e2DbHbmBEAdjA+qUxRGRkitnr3tLAo9G2XCYDmOxa44aMdeSoeb5SWWlWfM/jnFJjQNE
         0m24AVRxOuaOy71LV3rt7mxkHsHHZ7MVwuZQXgMcFcP6Ae+lLvAbpN8hfmbeO+YLf3bZ
         GF5g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5325PAIh3L9Zwq+zXck3FY2v61Hm2cWG+BYaGmym9TotcM539XIJ
	VZAhC9Jgqqir3K0u7YBQT9c=
X-Google-Smtp-Source: ABdhPJwEciPgWcVj5YZoAU6mNJKKrYBuVACNMwyIEh0xgsNsy3d8gNyptW4zgIcO18/WdvY0LyKNaQ==
X-Received: by 2002:a17:907:6d0e:b0:6f5:28b5:5f49 with SMTP id sa14-20020a1709076d0e00b006f528b55f49mr23728617ejc.577.1652282084136;
        Wed, 11 May 2022 08:14:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:8a10:b0:6f4:91cc:ac07 with SMTP id
 sc16-20020a1709078a1000b006f491ccac07ls1369399ejc.0.gmail; Wed, 11 May 2022
 08:14:42 -0700 (PDT)
X-Received: by 2002:a17:906:a0ce:b0:6d1:cb30:3b3b with SMTP id bh14-20020a170906a0ce00b006d1cb303b3bmr25123192ejb.582.1652282082479;
        Wed, 11 May 2022 08:14:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652282082; cv=pass;
        d=google.com; s=arc-20160816;
        b=w4AihPTwCzywffXmf+Z0fyWYpvoyEv9hbFjPYAPUznFtDIkc5e3wI/+UPe1fv11WHN
         5FDf6NJmFHlk+azbzzNdFXmZhuWG+cZsP2J07ofXugNDtLgwXZkbE+bbmWZKav/wqprj
         agTBg28B1kbVG8vVMYxzZlWWN5S6flVfpWE5PmhSCtV/gjOpQix1wYtqAU+u1AcW6ZKY
         lWgjoR6+k8DqMHx9jMa1/VaZmjrgvD8xniwFzJq9yxtjl3Vjx08wB52oz9fapzopYKsm
         mfHnMzhelpqO1dXi3DpPNAUiu4VNsUQLpJD6Bj1JI+shFNyS0TXyYUGR55a99IYbs0v6
         zjBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=P9tLPeqBc+To/03SqMzxp6ZoGGYfy9maGbWwc2xjtpg=;
        b=1ARvnfI5i2O5xCqBIWlLyUp8KgVfZzB8WQj+IRh5Zd/iVZV4EbvUiN0ilsZxod53Ub
         LNuWetrvxE4WsIsk2DLY5zcpi70UYfyELqLQrG1H9Wa+obnlZycA3BM0+Uip11hgyLAF
         g18OEEA3d68oPGHtyrzP3HqWXBG44MVr1DblBfbeC5sX4qHAhnOU32sA2ijMp5q/mRHa
         GTjbXXvb8rgVwip0vQ/Mt9wkfBBNO8Ow5BptfADdsRq/Z0bL/m95PHm4Mj1MwigQWzLu
         ZB8SFmlb1C6FdA9OdJpezbfZJ+0ltIAc89RCtsb1jo/CForhl2PcOlNGKPjqdmAIaXuo
         Cbqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=hJIP5Sn6;
       arc=pass (i=1);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe1f::616 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on0616.outbound.protection.outlook.com. [2a01:111:f400:fe1f::616])
        by gmr-mx.google.com with ESMTPS id ee47-20020a056402292f00b00425adbac75dsi176755edb.2.2022.05.11.08.14.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 May 2022 08:14:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe1f::616 as permitted sender) client-ip=2a01:111:f400:fe1f::616;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAxE0vM4wm6TnPi7h3dbKLTplUB0HaxDe2NtCmz4l4SkoZiF42ZP7vWmfkYGfCdO51GfhTDi7jyQc+w9PZzxgmYxnn8x27f5QfGlGhnV2uYRQaErS7eO66g1MKA5ZBFmVOmgx8k9mcBin3dRDCU2e7iAtamcPzMpWJB6MnbCABYmtwlGA4WZY30+F66n5A54RYvbPhWy4QzWgdAWBVzuLoF9kqryzYb8jkBqqq+QKAoSUvwCYHlrvho2i62nlFMWcOfxB7C7kgtXwVShKM0vITpYCxzcV+QuaRX+yR/ZGDhR+t+plTKriMdutXnmXFhYZAW/XjaYmqmyLSQOLfejyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9tLPeqBc+To/03SqMzxp6ZoGGYfy9maGbWwc2xjtpg=;
 b=jBerekCrA/glTcXZNNgBh9OhSQVb1H9Z4AaNN7dbgYtxaJw2CTFrKtKks7TStxzXgH6VoSkCtFFjbzJtbcKGQR/A+KtJl7AsAH7hsQ9GoVu0aH46Lo4MiUfqX2a4gRjSgm94YmwxFJdm2oTxqeyczuYRL1f9XtQQEkUZga/+bOg5IoyrCUhlASlJcgw81IdW6AwjTFVDE8aKSmBdmjuSgnY1uDSUffbOF9C/C5VMDpMzBmZ7Kqtz+JVvwbUAmVzeICI35z5AFRAXiepCmdcmcJxrUQRT1EEKuZ1ud5Rl/zxa6U8lmozxycF7dyJ31L84qaYGHTy/MxJOzbwKBX4FHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 194.138.21.71) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=temperror action=none header.from=siemens.com; dkim=none (message not
 signed); arc=none
Received: from AM6PR10CA0042.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::19)
 by DB8PR10MB3896.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:16d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Wed, 11 May
 2022 15:14:41 +0000
Received: from VE1EUR01FT067.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::6b) by AM6PR10CA0042.outlook.office365.com
 (2603:10a6:209:80::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Wed, 11 May 2022 15:14:40 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 194.138.21.71) smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=siemens.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of siemens.com: DNS Timeout)
Received: from hybrid.siemens.com (194.138.21.71) by
 VE1EUR01FT067.mail.protection.outlook.com (10.152.3.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 15:14:39 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 11 May 2022 17:14:38 +0200
Received: from [139.25.68.37] (139.25.68.37) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 11 May
 2022 17:14:38 +0200
Message-ID: <629dbc73-e149-3e2d-0181-fcad1ee4b9d3@siemens.com>
Date: Wed, 11 May 2022 17:14:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Jailhouse over ZCU-104
Content-Language: en-US
To: Daniele Ottaviano <danieleottaviano97@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <9baeea16-0fdd-4be9-a227-ff94d1ae5e82n@googlegroups.com>
 <9a81cc8e-3064-cad8-b66f-0711c2705111@siemens.com>
 <9806b760-e030-4183-8d18-7bc6349a027dn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <9806b760-e030-4183-8d18-7bc6349a027dn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [139.25.68.37]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--18.864200-8.000000
X-TMASE-MatchedRID: odSQQebQng05QaOxwNGfvo9bHfxDWoib5hFaeUreRMqIf3m0sUfx54nA
	h89Hsnb04TQVKfJL+uY8UyYxPpz6NlI2trVBdKuq4c9hRRd5/qTnog8SXCuTCd5x7RpGJf1aGUq
	OjzOC7IpHsxG18vGtbAvmSnR4RVecKvP0K3PRiiqoRfmzONNsP2DLp03iWbDJec1y1wrvN8VQLB
	vX11RpSR53XUX0iwoUciYFKMKtr7dlzP9S78W1g76ltlNQWFGi65bgh8ooRy4RW4LR41Fi8kMYr
	blfIl47jlXUAIjJm2eBlT+jl6FrYa8Cv9xSjJF8ImhQoShYQxEGoWKjxPpLD51U1lojafr/yJKl
	l9NT+dgwS+fKi1+IrgMuxYHusBZbTU7VCEN6UZGtL1mMSnuv1+rs0O+tafGzJ+mFatzELCPAmOf
	zKotTojHWiethCy35E4LeIK6Wkgo2GpeDLY7WfBaUjdaUmQndlXlA6F65Sc1sExK7i/Tm0zh4ai
	F3uCM2pzG+Ju2gKrcKVWBv5DfSi8y+v+qe/F2NDtI6jv8783L+9ZBF4vV8lfSG/+sPtZVkD6NL4
	tGmXzWUAUfla+IhaLKXWmEvaG3ECxvAgaTHFy9ftuJwrFEhTbew1twePJJB3QfwsVk0UbtuRXh7
	bFKB7r8hfoxXYzvz/VRKAVYjmXoBuijqYHOUfQbWBfy14/MlsBTJSD2iAW0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.864200-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 5B9D8E119E7D0A3AA786AA554B633E46002F134691C7344F972CEA6D139F15DA2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 105ef6b6-9b6b-4b91-964f-08da3360f7d0
X-MS-TrafficTypeDiagnostic: DB8PR10MB3896:EE_
X-Microsoft-Antispam-PRVS: <DB8PR10MB38963FCCDD5AB1CB2FAD607995C89@DB8PR10MB3896.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7xHAlq8i7Hsfxk2iMky7P40kCe1RunNCK6Yj4E8sQ03uQyQ2WaAoFmBCTUNwrx7m62//WxVKwamAg4DQ2gWIVo3qMYYRfOXTnbc3VFjFKdVJCSzOo1EDebYNNTKMj7a+zjRT7q1urZim76VwWNthCWysItNdURlrbK07qr6FXYdrac2cpk8vRBpsOYpq3T6h46XIHs/ZoZ4HMLF2EOi/H1O118MDTooQxX4gt9GS88KUMjmYZ1IiKxknoH2r6H0JTSi9rhuQALZ2uUy2l/XBw4v36vQJp8ezouKD5U+UhhD6GLEPgutMfc4qBfVwgoZNgZqIKnbJLLMVCBhy81VEJXXMRphBO3j4/Mxlw8cMAt5WheC3BjiwI3lbtPCadscPfF/olTQptSpoFaA2a2hW+MJ4bTaCp1lkhMk0/o3qhigFEY9qed7wkj9bQbqmXYpycFCk3SXO+pLMj+UswrIAdtZOEjamQsplqedBLxi+8Bv7cT4yxLc72ClTIz0jOz8HpzYZ5z3Rshc9zXfH68IHzWfh0HKNNpfcjegBEhaJEFY8GGMaz6aa2UmFFkO36Rx8VUltZAVnh+HI6EzA5/bxb58/tDi+cU4ZXvTuTFWVxwHPP8ykqzjU3b9JQ3HmmRkKXXjJEc4dKD/FXMqecFR1H1KcE40O+mQmKAq7yUlx8Ps1NGl/CQptYeW44nh35gWIFPtRTz/55OwhlGNp/qbN7BYJRUVDJaq8OtJbK2SlrNrbxXsghBXIiStXMBMzurSPQPvMjkLhPVcNK5JOSjlYkjblPFoGnXNyiS0pn+4eHiZyOqqJD8AxkAJRqNGe1lyJUcr5flYdw72jBSPhbrkSjg==
X-Forefront-Antispam-Report: CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(86362001)(31696002)(36756003)(966005)(2616005)(956004)(5660300002)(6706004)(186003)(82310400005)(44832011)(81166007)(16526019)(31686004)(70586007)(70206006)(53546011)(356005)(26005)(63370400001)(316002)(16576012)(47076005)(336012)(63350400001)(82960400001)(83380400001)(8936002)(8676002)(508600001)(40460700003)(36860700001)(2906002)(110136005)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 15:14:39.3301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 105ef6b6-9b6b-4b91-964f-08da3360f7d0
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT067.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3896
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=hJIP5Sn6;       arc=pass
 (i=1);       spf=pass (google.com: domain of jan.kiszka@siemens.com
 designates 2a01:111:f400:fe1f::616 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 11.05.22 17:02, Daniele Ottaviano wrote:
>=20
> Hi, thank you for your reply.=C2=A0
> I prefer, if possible, to use petalinux as a baseline to test also other
> mechanisms such as OpenAMP and kernel configurations such as the Linux
> Preempt-RT patch.=C2=A0
> Anyway, you were right, there was a problem in the petalinux build that
> luckily I managed to resolve. Now I'm able to boot the system but when I
> try to enable jailhouse I have the following error:
>=20
> root@xilinx-zcu104-2019_1:~# jailhouse enable /zynqmp-zcu104-root.cell
>=20
> Initializing Jailhouse hypervisor v0.12 on CPU 3
> Code location: 0x0000ffffc0200800
> Page pool usage after early setup: mem 39/994, remap 0/131072
> Initializing processors:
> =C2=A0CPU 3... OK
> =C2=A0CPU 1... OK
> =C2=A0CPU 0... OK
> =C2=A0CPU 2... OK
> Initializing unit: irqchip
> Initializing unit: ARM SMMU v3
> Initializing unit: PVU IOMMU
> Initializing unit: PCI
> Adding virtual PCI device 00:00.0 to cell "ZCU104-root"
> /home/user/jailhouse/hypervisor/ivshmem.c:407: returning error -EINVAL
> JAILHOUSE_ENABLE: Invalid argument
>=20
> I used a configuration file for zcu104 that I found in a mailing list
> conversation=C2=A0https://groups.google.com/g/jailhouse-dev/c/vMTEE3pYyPg=
/m/UeeqcdOhBgAJ
> (It is a modified version of the Ultra96 file):
> /*
> =C2=A0* Configuration for the ZCU104 root cell. Copied from ultra96.c
> =C2=A0* and changed where necessary.
> =C2=A0*/
>=20
> #include <jailhouse/types.h>
> #include <jailhouse/cell-config.h>
>=20
> struct {
> =C2=A0 =C2=A0 struct jailhouse_system header;
> =C2=A0 =C2=A0 __u64 cpus[1];
> =C2=A0 =C2=A0 struct jailhouse_memory mem_regions[3];
> =C2=A0 =C2=A0 struct jailhouse_irqchip irqchips[1];
> =C2=A0 =C2=A0 struct jailhouse_pci_device pci_devices[1];
> } __attribute__((packed)) config =3D {
> =C2=A0 =C2=A0 .header =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .signature =3D JAILHOUSE_SYSTEM_SIGNATURE,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .revision =3D JAILHOUSE_CONFIG_REVISION,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOL=
E,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hypervisor_memory =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .phys_start =3D 0x7fc00000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D =C2=A0 =C2=A0 =C2=A0 =
0x00400000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .debug_console =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .address =3D 0xff000000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D 0x1000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D JAILHOUSE_CON_TYPE_XU=
ARTPS,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_CON_ACCESS=
_MMIO |
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0JAILHOUSE_C=
ON_REGDIST_4,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .platform_info =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pci_mmconfig_base =3D 0xfc0000=
00,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pci_mmconfig_end_bus =3D 0,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pci_is_virtual =3D 1,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .gic_version =3D =
2,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .gicd_base =3D 0x=
f9010000, /*GIC distributor register base*/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .gicc_base =3D 0x=
f902f000, /*GIC cpu interface register base*/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .gich_base =3D 0x=
f9040000, /*GIC virtual interface control
> register base*/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .gicv_base =3D 0x=
f906f000, /*GIC virtual cpu interface
> register base*/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .maintenance_irq =
=3D 25,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .root_cell =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D "ZCU104-root",
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .cpu_set_size =3D sizeof(config=
.cpus),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .num_memory_regions =3D ARRAY_S=
IZE(config.mem_regions),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .num_irqchips =3D ARRAY_SIZE(co=
nfig.irqchips),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .num_pci_devices =3D ARRAY_SIZE=
(config.pci_devices),
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .vpci_irq_base =3D 136-32,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
> =C2=A0 =C2=A0 },
>=20
> =C2=A0 =C2=A0 .cpus =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xf,
> =C2=A0 =C2=A0 },
>=20
> =C2=A0 =C2=A0 .mem_regions =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* MMIO (permissive) */ {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .phys_start =3D 0xfd000000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virt_start =3D 0xfd000000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x03000000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE |
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 JAILHOUSE_MEM_IO,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* RAM */ {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .phys_start =3D 0x00000000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virt_start =3D 0x00000000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D =C2=A0 =C2=A0 =C2=A0 =
0x7fb00000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE |
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 JAILHOUSE_MEM_EXE=
CUTE,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* IVSHMEM shared memory region for 00:00.0 *=
/ {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .phys_start =3D 0x7fb00000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virt_start =3D 0x7fb00000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D =C2=A0 =C2=A0 =C2=A0 =
0x00100000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 },

You need more ivshmem regions here. See other ivshmem-enabled configs.

Jan

--=20
Siemens AG, Technology
Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/629dbc73-e149-3e2d-0181-fcad1ee4b9d3%40siemens.com.
