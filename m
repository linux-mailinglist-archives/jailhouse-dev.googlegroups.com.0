Return-Path: <jailhouse-dev+bncBAABBXG5YWNQMGQEIP57B6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 331AF6272E7
	for <lists+jailhouse-dev@lfdr.de>; Sun, 13 Nov 2022 23:25:34 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id p20-20020a2ea4d4000000b0027755d182edsf3189019ljm.18
        for <lists+jailhouse-dev@lfdr.de>; Sun, 13 Nov 2022 14:25:34 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1668378333; cv=pass;
        d=google.com; s=arc-20160816;
        b=Slwn0r9YDXgQMIUHzBl4WBzEToqQm0v8ABWGKI3GKhiR09pyNGg/bThOXCT1cPb79V
         kFdtAAm+FBPtyyxYZMOCdfpgM33SRXMM3RAM46RCO4BRw+znvrGdcF8SFgw+gVWvEe5T
         Sji72HxZ7ervhsEIyffKbK/KcOk2urb41t5J+VJkRddXcy6848Sp6fFrYY4SnJeLIPoE
         crdTldsaSBnT6y7ur09MW6PoVAPjojqhdOQ+qLeb1DZwI7ED+6QX60OFZKxE8WxHVr1F
         eNAegKWp5UgUqC3hJMAhjErvQ85/WMKs//tYQSramPnFjRJhNhFNuigX2wNqF6Mz8rTA
         sDdg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:msip_labels
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:cc:to:from:sender
         :dkim-signature;
        bh=qFiwXC8MRyObpoHT953q5mMQak4n22hEyLyVSzk/mkQ=;
        b=rEwgpjeWHAgprGWRHiFH59xqQL270C/fLjPmqoWm0SUpQTHynbKpeO8k1EnPNZ3mcG
         cdiwPcpiMhPcfIhap38ni14C9SVloyuDwOS2JBsiuCQBAcT0WPE26wj0LxxdPHlD/p9Q
         bOWOnX0J8563GjuLpez5paWogvClG8XNrcFsnnyoBIAW1DXvD0EDtsKm3hK+MICr6/I9
         LdLcWcyeQfOT0VOHaqO1lLG4fq/LnCrKKOz+pHqNYKYHCDmTPRanbYaTT1R6OMeTZpje
         5TMmU1Y+xjrB28UpXVFmlLSiiIYxWb6ibaBmMhVQy5ewXada69pYhlPyNrAClhiGxY8Y
         59uQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ed.ac.uk header.s=selector1 header.b=DKR9tGLk;
       arc=pass (i=1 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass fromdomain=ed.ac.uk);
       spf=pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.16.10 as permitted sender) smtp.mailfrom=Karim.Manaouil@ed.ac.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ed.ac.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:msip_labels:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFiwXC8MRyObpoHT953q5mMQak4n22hEyLyVSzk/mkQ=;
        b=BtYtNCbdhRpVwhojS+J9BlmP1awTZGF/rj612F1dx9/JocZJlEyCKgjku851MikMyi
         rcRbod9tm8nBQIe8N2mLmaznYHxHzvSXLsR4SDkLd8JbO+1uS7tRtVm2tQSlu1PjrMiI
         dJM7aGz+J7qX6mcE09XnP101sarw1ZDOrtyTfI0pnBAD+GD4SNRBpWtr3I1CBbp4bMUD
         0mrV28kZTkvCQ9KZW5JTR9ZlaXay+4aTZASdtqj+CTI2zZdQ7+/TX4BwHnbDonBqfNFc
         jiQX+Jmqss1OQZOpBytHV1kgtqRTBLW8zBuKLkEiat4YA4rFjma9T/8KaC4TMvMqwp0r
         lyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :msip_labels:content-language:accept-language:in-reply-to:references
         :message-id:date:thread-index:thread-topic:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qFiwXC8MRyObpoHT953q5mMQak4n22hEyLyVSzk/mkQ=;
        b=wPwCuREKwQF95OSHgjcReTdP4y0AED56zcsXjRettaVMOe93oYiySHxadBeMRLb8v3
         mHTC+laGJAPIrgFMzXHJmUnDfGDtaHadqkl/ADYbnaiDF8kvglpObGsJsuGD9o97ZLht
         YUcefTWfpu2PtYEnIWzpvysNp1HBu6qY4S1n/6ZdTP1hnyJp8XQjaZMgj8k3ZIKBA0xb
         juLyreznAQRLMvBXHA1oCEEhk8/dxU8ikAhAGDaLL4q7/ajjqbRPt+aJtU3ovy4dDBhZ
         PxmrDAi9cO0lXA+Cj2Tdx07rRbTRKi43ZYGeI8X5T4g65XbkJ9HkeQ/OEKS14g20n6DW
         B6Jg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pkfWHVdHgy8QG/SouJo5cJFJ6qgKpKjVIN3YcZyrKumAbNYMgxx
	NhARpZtAGIKJxjk0LQEdOgw=
X-Google-Smtp-Source: AA0mqf4OUGoOI4UfgredD3R+l5LdFvi4PraMPnNn38zPldPtXWGlmBklfbyLkYbN5mgvFswoixMMMg==
X-Received: by 2002:a2e:888f:0:b0:277:515b:3dcd with SMTP id k15-20020a2e888f000000b00277515b3dcdmr3204756lji.501.1668378333350;
        Sun, 13 Nov 2022 14:25:33 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:74e:b0:49a:b814:856d with SMTP id
 c14-20020a056512074e00b0049ab814856dls3382466lfs.1.-pod-prod-gmail; Sun, 13
 Nov 2022 14:25:31 -0800 (PST)
X-Received: by 2002:a05:6512:20c8:b0:4ab:6c73:28cb with SMTP id u8-20020a05651220c800b004ab6c7328cbmr3146039lfr.504.1668378331363;
        Sun, 13 Nov 2022 14:25:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1668378331; cv=pass;
        d=google.com; s=arc-20160816;
        b=aIM2wHZFScuRGh4qOMfvYj5fRGiM++36N907+1oIRXWwUIOvPM0ckr//gcD4Bt5ChY
         BlWRFrzbaLvaNZcDOSULHh9TQkdjYN7fAlzyrdFQBVyTt4TvHHjY4xBTRpFXlvraOROW
         65dlk3UsVpcSxr1XWe034mEDe/XyXN+8uowFMs1N6IYJMq74lxS0CwhiPJrg17jqKF4m
         Qjw2XteaVjid/zrnjn0Q+pDOt36QJDE4Hmah9vMojcq0PxO5oDpTIlZDowmKcns4v6YP
         YLxbKYc49qv0fieDqyBPamzAcK3HqBPjiAIr82Pafg/zbX14zLyTZbiYseV9Anhdxc7l
         AKjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:dkim-signature;
        bh=IfiNOJD/tRLxxdT7KkN6EbOgz4s8HwuoC5hucljuLGI=;
        b=BSMjuH2v1ESoRFP0auMMpBJqh/Y9ptMhLwVxTGwUXYoMzYkLtZ62Lx/kqNjwnHpp8n
         CeMQnCQ1l6OQlciIM1814maOaHhmAodbCjTsSVOEAOtnJnEPP7uzZaYDTG9DODT0kXEx
         mKY6qBbQbt2bnjDu4NmndTrF5yjgbStyCW0fKk7uJMGVImcnwrSLXj3QdZ2dU0knwz7E
         5TCvaeTP/oXwtWR18EFCKKh8YKn+I9XrwdhlLtPVxxeUJ/ySWZPRudZp/lZI9dA2fFv+
         lZcngZpZbQeJeao+6iAxpuOw0EbPDDpn5MDYDr0BUPsTUFI8I2rAmhlq5bTUTanZEzYJ
         MWjw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ed.ac.uk header.s=selector1 header.b=DKR9tGLk;
       arc=pass (i=1 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass fromdomain=ed.ac.uk);
       spf=pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.16.10 as permitted sender) smtp.mailfrom=Karim.Manaouil@ed.ac.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ed.ac.uk
Received: from loire.is.ed.ac.uk (loire.is.ed.ac.uk. [129.215.16.10])
        by gmr-mx.google.com with ESMTPS id w17-20020a05651234d100b004a222ff195esi256873lfr.11.2022.11.13.14.25.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Nov 2022 14:25:31 -0800 (PST)
Received-SPF: pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.16.10 as permitted sender) client-ip=129.215.16.10;
Received: from exseed.ed.ac.uk (hbdat3.is.ed.ac.uk [129.215.235.38])
	by loire.is.ed.ac.uk (8.14.7/8.14.7) with ESMTP id 2ADMPQkq014538
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 13 Nov 2022 22:25:27 GMT
Received: from hbdat3.is.ed.ac.uk (129.215.235.38) by hbdat3.is.ed.ac.uk
 (129.215.235.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Sun, 13 Nov
 2022 22:25:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.113)
 by hbdat3.is.ed.ac.uk (129.215.235.38) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.13 via Frontend Transport; Sun, 13 Nov 2022 22:25:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjXqimUm5r3T1phCn7ozAaWdVTd2l/K0h2UxlrJTKWalYte+ObaM57e+AbwM5n5+CiUjcrERnhD4SZ5yV/Piu9bBcVeq8FR0Kp8b5OP0qZNemNJ6qAVx280NWpMNo65sM19Zxcus+1sk3GympNjlPgCZqacv8fauiPP8ilnmI7/N2p74llTXuxpl6PId4EDSq6Ox9ASBkeRV/mRuXhXbeUPWp43CoaegIXYMNCva93jFHC921tDLM3fbt92SOQbn+PlHicWdSUpCZFcJwOW6+hox5dUMUVE8IE9cYYA9fwtu1TepiekJcC+uLtSHorB8igNDYZnQgeKrltfsuDflCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfiNOJD/tRLxxdT7KkN6EbOgz4s8HwuoC5hucljuLGI=;
 b=F+GkkZqfqC7MOXFuXKwySPdhq+Kx40EVj5j3EQDwH7qImcvLSTJAKu3c1KkJyE1heZX5yDQuyw0jmYAF9z3FqNFsN23wqAXeHJ3QnNxJjsjt1JDXSdndZfilcDuzcyKeZVM6gl34yF81L/EcL441IfxLvanO3muvb1bGnE4MwpPuNV+TVUwLL6B8AEvofnzrEb7FDkUblFZClWu9GKwHwOpYA9n8itrpOmFL9GtYPp99N+uj7Wi8YmmdLPRIHQADbItOd0upVPW2h4iuP+DMhrkaDYsip9dWZFiOtRsoLlB1HrKl30Yr5JFCEVOhmmEAlhgxlFNforqs8WTy562FaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ed.ac.uk; dmarc=pass action=none header.from=ed.ac.uk;
 dkim=pass header.d=ed.ac.uk; arc=none
Received: from AM0PR05MB6018.eurprd05.prod.outlook.com (2603:10a6:208:12b::26)
 by DB9PR05MB8380.eurprd05.prod.outlook.com (2603:10a6:10:29b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Sun, 13 Nov
 2022 22:25:24 +0000
Received: from AM0PR05MB6018.eurprd05.prod.outlook.com
 ([fe80::6971:6f6d:49f7:1d5e]) by AM0PR05MB6018.eurprd05.prod.outlook.com
 ([fe80::6971:6f6d:49f7:1d5e%5]) with mapi id 15.20.5813.017; Sun, 13 Nov 2022
 22:24:45 +0000
From: Karim Manaouil <Karim.Manaouil@ed.ac.uk>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        "jan.kiszka@siemens.com"
	<jan.kiszka@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: Re: Jailhouse: enter_hypervisor returns -ENOMEM
Thread-Topic: Jailhouse: enter_hypervisor returns -ENOMEM
Thread-Index: AQHY9rkzsgTc3CVeRkSVzYW63qokCK47kFSAgAHcNMA=
Date: Sun, 13 Nov 2022 22:24:45 +0000
Message-ID: <AM0PR05MB601899CAC211F4C81A9757DFA9029@AM0PR05MB6018.eurprd05.prod.outlook.com>
References: <AM0PR05MB6018F1663ABE61DA3C697CA4A9039@AM0PR05MB6018.eurprd05.prod.outlook.com>
 <63d52496-ac3e-8dfd-112f-8e723d0af98a@oth-regensburg.de>
In-Reply-To: <63d52496-ac3e-8dfd-112f-8e723d0af98a@oth-regensburg.de>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR05MB6018:EE_|DB9PR05MB8380:EE_
x-ms-office365-filtering-correlation-id: 849a0768-f2fc-4b7a-3010-08dac5c5de07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PXcwhbciIQ6Gof6J0eUp5rzjBx2zlqrI9nOAWfvDtcTS2oZNCMCaYsi1n7CfW5/yyrN6cMpSgzpUF2in6merbFHIvY29QfqXyqNMHuwogkKkeO51OgrlXU49xmuhG/iKY+2lyNr4ZZeLHh1/vVAdpRfe29f+RtKn26H1Ss9MhGB/VUwG2tQULKv4uXQeRt7UjBln5YuanDpGYCc5LCcV02zBEeJUfEhA9NMMzlKTR7IG8Ba4ppTw+RrnmErNtdKJWzhkT/l9k5jxBZTYQGn9Adp8gPyVE35d6mNoQufNWiRsx8PNG8RlVI1/SEu/c3vIF4IEpxeTiOih7MHkJlrvqCSrTLV4gSi1aOEUtVTBIo7+GEwu0cGqxQy0Tb8Ft7lLLy8S75r0bpQcllvLPaWxoaTbqNv99Kp3C0eLba8NcM65F/9G2C6ayMJTKrep23nBIDnZFyNYMeD9rQvOfG/foCfiOpOF2LJ8V1AMUiQQz854gYuvhb3aNuBRUTmc53KN7SY1OH1UG+hjspJtfk3SJ9/CvZdKUAoeTEy7T15oZlFknnsz1N4Eg2eW5CpliCw+21lwJVYdbLWIU/wW+rNYZBnRB7fIE/1x81vXSn2PyUZqf+j6vC6WOptS4Au0lFPLldgJA2rMGb4tfZ29RjFq0S3G6HuJzdDtJBgEEkRpqvcTT9qgQbHTO0Xb3G6Pp/grZnJBn7YYQ70AwqCGie/YRSyEqM71QmBOVLZhRBC0R8Kk+ke36nWoR0rJLbRCH+HX3aEodnlX2miilzbVLB3Sp3aCkcmZvPBS3PLZDzJSBDxNDYRfU1oYnrrZlKu0uTM5AjFJ/IFOaRJoFs5kmeKNQA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR05MB6018.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(396003)(366004)(39860400002)(376002)(451199015)(19627405001)(66899015)(33656002)(99936003)(122000001)(38100700002)(38070700005)(316002)(41300700001)(64756008)(2906002)(166002)(83380400001)(86362001)(91956017)(66946007)(76116006)(186003)(478600001)(786003)(45080400002)(110136005)(966005)(41320700001)(7696005)(4326008)(8936002)(52536014)(5660300002)(26005)(6506007)(66556008)(9686003)(71200400001)(55016003)(53546011)(66476007)(66446008)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?3cXbmazUE5TNr0Mt1P7zEADUGdL+sM+kY0z/HkCq5MpqPCUGzKLO6rye?=
 =?Windows-1252?Q?20Ety5RRt8L9Qv+s2bqOo4485OaLaN74p3k8s/lPaKi/TlQhXYlf60yq?=
 =?Windows-1252?Q?2ypAzIhIVqhYMO8gP2QC1W6Kh/luIB+iArAKXAxQ8Q4v71haBeZgfWMm?=
 =?Windows-1252?Q?ILz5hrdDLt5jOyaJH3t1if5SXQRYL+QU/vmMHheDSWur2TG+T2UdalEc?=
 =?Windows-1252?Q?AxI/bnC0ldKz2mARqucXmmx0UHpNzmL0Ps7xCq/wYWmd8QIAowXo1uhR?=
 =?Windows-1252?Q?bAVjNoHGKV8aLQnBlRryaL60VWJe9ZKzCPEPmyjZoYkTA5w8la+P/3ux?=
 =?Windows-1252?Q?sMJAFYVFfsChDmw1YcuPIK3J1K/ejzK1J+/lrD44x1Db50jXP9Y3Wlhc?=
 =?Windows-1252?Q?B1rO0ar2amyz6JCNy/ulwThSRlv+35AYmKB0d36Y0fI3nqDubxHSjeDT?=
 =?Windows-1252?Q?nB/+TXh6Ts8Npb1r1rhdW9UnDjC5kTiuXqkP8Lj9pdsAAI0jF7HYzXrg?=
 =?Windows-1252?Q?I+7h4EuP4Qb2oAKUWTv8SyibvGY2vmypdTEj3QXjHBjVeo3xjMgwIQdY?=
 =?Windows-1252?Q?LOUvIzbmn16A+s7LpGpYkQySbRxDS18ggUMdk2ydWJxHRjSFi7+DNJWa?=
 =?Windows-1252?Q?zHfDpJ9IsDNumQupcyJ/Mp8A/AO6FCCN8XkfwUOVYro0CmfqvYrHNZCn?=
 =?Windows-1252?Q?D227d+xxhsscnPK7i0KHagmtjCGRoRXyHa+BCyze78Zh+ld8pW8u+DIH?=
 =?Windows-1252?Q?LM+mQURjGYtzqDtzjFWpQ+1fzierKNwzrQAsb37hrtdw7JfkefMf7cQB?=
 =?Windows-1252?Q?XXcf17aepEkBeGeJIiav5xcH62BUKJhkpS529IdZ9WBIGfdejgd7pwSO?=
 =?Windows-1252?Q?ajwc0iZ4EgTuQuIEuP9HrB0H2TNp60VEho8XfbEg2ItP8hLvjlris36U?=
 =?Windows-1252?Q?cKZMk3XLM4JXIe8ynqRBRgEbIN1uOSjSQBA00e6chKakOAZoQu9DT+nq?=
 =?Windows-1252?Q?T/ZalSx3m2hMOtLP0l2t4XMr0bQwzsndGmIqxHWNsMWcp3hyS82RkoQL?=
 =?Windows-1252?Q?EO6exreeYWgrtx7+AByf792TNpViJMWiS40YNF/WBItL1a4r+fvBKWja?=
 =?Windows-1252?Q?1mn9kKIEK2zXcL3WVI7+9Jldtf+3QHjcgA+hW6gsR/IL6BXuGcBp1Sw7?=
 =?Windows-1252?Q?KHnvNJP82YhCnpNuGQOFz6sQj1gDtvhQ/H0qMDV0gaWW1BIN+r/7WPyV?=
 =?Windows-1252?Q?frUXTG3vcHrBOBYxrAh1OsmbwjlX0OtNk3j3Cw63eZhk+wJJ+Y0Z+OkX?=
 =?Windows-1252?Q?LD1LUNuHtLX6TIAIYHj35hsSyZK/fDXys8E6BlWfR2zYeXKPrQlCuDSA?=
 =?Windows-1252?Q?QewONrTq2jX/k6FlgeCx0kRfcxJr6fn9vFfVukY24Qc46GxL0raBiJOs?=
 =?Windows-1252?Q?hcD6hRaaOMVc1cZVGFnCaikjlMGxoHWFeggbBjcJ/AysOeQUZc35CQGC?=
 =?Windows-1252?Q?b3vXPYEkZagwEpqNyHI2N7G3P0jrwxs9vSUzm7GxXCY/u2TNRQMsGiw7?=
 =?Windows-1252?Q?FDloWzx/OKpmBXZA8W6anFtdqjtsqDoOvypO8yDK9N0QjEOV1lBbrcLa?=
 =?Windows-1252?Q?uXrrJkpCy++zj3oqgWQ0R+eZy2WJ+3KI2OWHnmK320t5F6fkPB4rRCrC?=
 =?Windows-1252?Q?lDxlpE8AFxs=3D?=
Content-Type: multipart/mixed;
	boundary="_004_AM0PR05MB601899CAC211F4C81A9757DFA9029AM0PR05MB6018eurp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR05MB6018.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 849a0768-f2fc-4b7a-3010-08dac5c5de07
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2022 22:24:45.0119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e9f06b0-1669-4589-8789-10a06934dc61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ma8//M66meRj44EtMI9s6oNCNsrV/gJlczuP8qwfUuq9tvWaC7ahssOWCaHToIBlyqxGlgXAt/F18KRlhDvqFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR05MB8380
X-OriginatorOrg: ed.ac.uk
X-Edinburgh-Scanned: at loire.is.ed.ac.uk
X-Original-Sender: karim.manaouil@ed.ac.uk
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ed.ac.uk header.s=selector1 header.b=DKR9tGLk;       arc=pass (i=1
 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass
 fromdomain=ed.ac.uk);       spf=pass (google.com: domain of
 karim.manaouil@ed.ac.uk designates 129.215.16.10 as permitted sender)
 smtp.mailfrom=Karim.Manaouil@ed.ac.uk;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=ed.ac.uk
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

--_004_AM0PR05MB601899CAC211F4C81A9757DFA9029AM0PR05MB6018eurp_
Content-Type: multipart/alternative;
	boundary="_000_AM0PR05MB601899CAC211F4C81A9757DFA9029AM0PR05MB6018eurp_"

--_000_AM0PR05MB601899CAC211F4C81A9757DFA9029AM0PR05MB6018eurp_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

Thanks for the reply!

>Did you use jailhouse-config-create?

I am using `jailhouse config create` to generate the sysconfig.c file.

>You can use the --mem-hv option to
increate the memory. Try, for example, 32MiB and see if it works.

I tried with 32MiB. It worked. I am not getting -ENOMEM anymore.
The driver prints "The Jailhouse is opening" on dmesg. However, right after=
 that
the CPUs get stuck, and I get rcu_sched detected stalls. The system is comp=
letely
irresponsive.

I attached a text file containing the full output from dmesg. Here is the i=
nitial part:

[  434.792008] The Jailhouse is opening.
[  455.787315] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  455.793303] rcu:     1-...0: (839 GPs behind) idle=3Dc2a/1/0x40000000000=
00000 softirq=3D681/681 fqs=3D1827
[  455.802292] rcu:     2-...0: (144 GPs behind) idle=3D812/1/0x40000000000=
00000 softirq=3D905/905 fqs=3D1827
[  455.811276] rcu:     3-...0: (144 GPs behind) idle=3Deaa/1/0x40000000000=
00000 softirq=3D719/719 fqs=3D1827
[  455.820266] rcu:     4-...0: (1 GPs behind) idle=3Dc2e/1/0x4000000000000=
000 softirq=3D1324/1324 fqs=3D1827
[  455.829252] rcu:     5-...0: (144 GPs behind) idle=3D41a/1/0x40000000000=
00000 softirq=3D556/556 fqs=3D1827
[  455.838238] rcu:     6-...0: (144 GPs behind) idle=3D912/1/0x40000000000=
00000 softirq=3D777/777 fqs=3D1827
[  455.847218] rcu:     7-...0: (144 GPs behind) idle=3D5e6/1/0x40000000000=
00000 softirq=3D2409/2410 fqs=3D1827
[  455.856404]  (detected by 87, t=3D5253 jiffies, g=3D48537, q=3D364)
[  455.862170] Sending NMI from CPU 87 to CPUs 1:
[  465.776884] Sending NMI from CPU 87 to CPUs 2:
[  467.182686] watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [kworker/0=
:1:7]
[  467.189857] Modules linked in: jailhouse(O) nf_conntrack_netlink xfrm_us=
er xt_addrtype br_netfilter xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJE=
CT nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_natp
[  467.189928]  binfmt_misc configfs efivarfs ip_tables x_tables autofs4 ex=
t4 crc16 mbcache jbd2 raid10 raid456 libcrc32c crc32c_generic async_raid6_r=
ecov async_memcpy async_pq async_xor xor async_tx raid6_pq ]
[  467.320567] CPU: 0 PID: 7 Comm: kworker/0:1 Tainted: G           O      =
5.10.0 #3
[  467.328767] Hardware name: Dell Inc. PowerEdge R7425/08V001, BIOS 1.15.0=
 09/11/2020
[  467.337154] Workqueue: events drm_fb_helper_dirty_work [drm_kms_helper]
[  467.344501] RIP: 0010:smp_call_function_many_cond+0x289/0x2d0
[  467.350979] Code: e8 1c 8a 39 00 3b 05 0a c1 74 01 89 c7 0f 83 0b fe ff =
ff 48 63 c7 49 8b 16 48 03 14 c5 00 d9 99 9c 8b 42 08 a8 01 74 09 f3 90 <8b=
> 42 08 a8 01 75 f7 eb c9 48 c7 c2 20 cf 07 9d 4c 89 fe 44 7
[  467.371232] RSP: 0018:ffffa7d78015fcd8 EFLAGS: 00000202
[  467.377220] RAX: 0000000000000011 RBX: 0000000000031280 RCX: 00000000000=
00001
[  467.385123] RDX: ffff964f1fa31280 RSI: 0000000000000000 RDI: 00000000000=
00001
[  467.393024] RBP: 0000000000000000 R08: 0000000000000000 R09: 00000000000=
00001
[  467.400928] R10: 0000000000000002 R11: 0000000000000002 R12: 00000000000=
00000
[  467.408836] R13: 000000000000007f R14: ffff962f1f42c9c0 R15: 00000000000=
00080
[  467.416737] FS:  0000000000000000(0000) GS:ffff962f1f400000(0000) knlGS:=
0000000000000000
[  467.425604] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  467.432127] CR2: 0000000000000000 CR3: 00000010987ea000 CR4: 00000000003=
506f0
[  467.440045] Call Trace:
[  467.443289]  ? tlbflush_read_file+0x70/0x70
[  467.448266]  ? tlbflush_read_file+0x70/0x70
[  467.453242]  on_each_cpu+0x2b/0x60
[  467.457437]  __purge_vmap_area_lazy+0x5d/0x680
[  467.462679]  ? _cond_resched+0x16/0x40
[  467.467224]  ? unmap_kernel_range_noflush+0x2fa/0x380
[  467.473072]  free_vmap_area_noflush+0xe7/0x100
[  467.478315]  remove_vm_area+0x96/0xa0
[  467.482770]  __vunmap+0x8d/0x290
[  467.486792]  drm_gem_shmem_vunmap+0x8b/0xa0 [drm]
[  467.492299]  drm_client_buffer_vunmap+0x16/0x20 [drm]
[  467.498144]  drm_fb_helper_dirty_work+0x187/0x1b0 [drm_kms_helper]
[  467.505118]  process_one_work+0x1b6/0x350
[  467.509912]  worker_thread+0x53/0x3e0
[  467.514361]  ? process_one_work+0x350/0x350
[  467.519338]  kthread+0x11b/0x140
[  467.523342]  ? __kthread_bind_mask+0x60/0x60
[  467.528389]  ret_from_fork+0x22/0x30

Cheers
Karim
________________________________
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Sent: 12 November 2022 17:47
To: Karim Manaouil <Karim.Manaouil@ed.ac.uk>; jan.kiszka@siemens.com <jan.k=
iszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com>
Subject: Re: Jailhouse: enter_hypervisor returns -ENOMEM

This email was sent to you by someone outside the University.
You should only click on links or attachments if you are certain that the e=
mail is genuine and the content is safe.

On 12/11/2022 18:15, Karim Manaouil wrote:
> Hi Jan,
>
> I am trying to deploy Jailhouse on an AMD EPYC with 128 CPUs (8 NUMA
> nodes), running Linux kernel v5.10 (same version used by jailhouse CI
> with same patches applied).
>
> `jailhouse hardware check` return that everything is ok and that "Check
> passed!".
>
> Memory was reserved via `memmap=3D0x5200000$0x3a000000`
>
> However, enter_hypervisor() [1] fails when entry() is called on every
> cpu and return -ENOMEM as error_code.

Try to reserve more memory. Maybe the default size of 6MiB for HV memory
is insufficient for 128 CPUs.

Did you use jailhouse-config-create? You can use the --mem-hv option to
increate the memory. Try, for example, 32MiB and see if it works.

   Ralf

>
> Do you possibly know where could the issue come from?
>
> Best
> Karim
>
> [1]
> https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2=
cbd99f9fc/driver/main.c#L251 <https://github.com/siemens/jailhouse/blob/c7a=
1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251>
>
> The University of Edinburgh is a charitable body, registered in
> Scotland, with registration number SC005336. Is e buidheann carthannais
> a th=E2=80=99 ann an Oilthigh Dh=C3=B9n =C3=88ideann, cl=C3=A0raichte an =
Alba, =C3=A0ireamh cl=C3=A0raidh
> SC005336.
>
> --
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA=
3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com <https://groups.goo=
gle.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0P=
R05MB6018.eurprd05.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter>=
.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AM0PR05MB601899CAC211F4C81A9757DFA9029%40AM0PR05MB6018.eurprd=
05.prod.outlook.com.

--_000_AM0PR05MB601899CAC211F4C81A9757DFA9029AM0PR05MB6018eurp_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">H=
i Ralf,</span><br>
<br>
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">Thanks=
 for the reply!</span></div>
<div><br>
</div>
<div><i><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; =
font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);=
">&gt;</span><span style=3D"font-family: Calibri, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, =
255);">Did
 you use jailhouse-config-create?</span><span style=3D"font-family: Calibri=
, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); backg=
round-color: rgb(255, 255, 255);">&nbsp;</span></i></div>
<div><br>
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">I am u=
sing `</span><span style=3D"font-family: Calibri, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, =
255);">jailhouse
 config create` to generate the sysconfig.c file.</span></div>
<div><br>
</div>
<div><i><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; =
font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);=
">&gt;</span><span style=3D"font-family: Calibri, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, =
255);">You
 can use the --mem-hv option to</span><br>
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">increa=
te the memory. Try, for example, 32MiB and see if it works.</span></i></div=
>
<div><br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">I=
 tried with 32MiB. It worked. I am not getting -ENOMEM anymore.&nbsp;</span=
></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">T=
he driver prints &quot;</span><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">The
 Jailhouse is opening&quot; on dmesg. However, right after that</span></div=
>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">the CPUs&nbsp;</span><span style=3D"font-family: Ca=
libri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); =
background-color: rgb(255, 255, 255);">get
 stuck, and I get rcu_sched detected stalls. The system is completely</span=
></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">irresponsive.</span></div>
<div><br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">I=
 attached a text file containing the full output from dmesg. Here is the in=
itial part:</span></div>
<div><br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;434.792008] The Jailhouse is opening.</span>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;455.787315] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:</spa=
n></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;455.793303] rcu: &nbsp; &nbsp; 1-...0: (839 GPs behind) idle=3Dc2a/1=
/0x4000000000000000 softirq=3D681/681 fqs=3D1827</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;455.802292] rcu: &nbsp; &nbsp; 2-...0: (144 GPs behind) idle=3D812/1=
/0x4000000000000000 softirq=3D905/905 fqs=3D1827</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;455.811276] rcu: &nbsp; &nbsp; 3-...0: (144 GPs behind) idle=3Deaa/1=
/0x4000000000000000 softirq=3D719/719 fqs=3D1827</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;455.820266] rcu: &nbsp; &nbsp; 4-...0: (1 GPs behind) idle=3Dc2e/1/0=
x4000000000000000 softirq=3D1324/1324 fqs=3D1827</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;455.829252] rcu: &nbsp; &nbsp; 5-...0: (144 GPs behind) idle=3D41a/1=
/0x4000000000000000 softirq=3D556/556 fqs=3D1827</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;455.838238] rcu: &nbsp; &nbsp; 6-...0: (144 GPs behind) idle=3D912/1=
/0x4000000000000000 softirq=3D777/777 fqs=3D1827</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;455.847218] rcu: &nbsp; &nbsp; 7-...0: (144 GPs behind) idle=3D5e6/1=
/0x4000000000000000 softirq=3D2409/2410 fqs=3D1827</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;455.856404] &nbsp;(detected by 87, t=3D5253 jiffies, g=3D48537, q=3D=
364)</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;455.862170] Sending NMI from CPU 87 to CPUs 1:</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;465.776884] Sending NMI from CPU 87 to CPUs 2:</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.182686] watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [kwork=
er/0:1:7]</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.189857] Modules linked in: jailhouse(O) nf_conntrack_netlink xfr=
m_user xt_addrtype br_netfilter xt_CHECKSUM
 xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat =
nft_chain_nat nf_natp</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.189928] &nbsp;binfmt_misc configfs efivarfs ip_tables x_tables a=
utofs4 ext4 crc16 mbcache jbd2 raid10 raid456
 libcrc32c crc32c_generic async_raid6_recov async_memcpy async_pq async_xor=
 xor async_tx raid6_pq ]</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.320567] CPU: 0 PID: 7 Comm: kworker/0:1 Tainted: G &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; O &nbsp; &nbsp; &nbsp;5.10.0 #3</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.328767] Hardware name: Dell Inc. PowerEdge R7425/08V001, BIOS 1.=
15.0 09/11/2020</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.337154] Workqueue: events drm_fb_helper_dirty_work [drm_kms_help=
er]</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.344501] RIP: 0010:smp_call_function_many_cond+0x289/0x2d0</span>=
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.350979] Code: e8 1c 8a 39 00 3b 05 0a c1 74 01 89 c7 0f 83 0b fe=
 ff ff 48 63 c7 49 8b 16 48 03 14 c5 00
 d9 99 9c 8b 42 08 a8 01 74 09 f3 90 &lt;8b&gt; 42 08 a8 01 75 f7 eb c9 48 =
c7 c2 20 cf 07 9d 4c 89 fe 44 7</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.371232] RSP: 0018:ffffa7d78015fcd8 EFLAGS: 00000202</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.377220] RAX: 0000000000000011 RBX: 0000000000031280 RCX: 0000000=
000000001</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.385123] RDX: ffff964f1fa31280 RSI: 0000000000000000 RDI: 0000000=
000000001</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.393024] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000=
000000001</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.400928] R10: 0000000000000002 R11: 0000000000000002 R12: 0000000=
000000000</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.408836] R13: 000000000000007f R14: ffff962f1f42c9c0 R15: 0000000=
000000080</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.416737] FS: &nbsp;0000000000000000(0000) GS:ffff962f1f400000(000=
0) knlGS:0000000000000000</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.425604] CS: &nbsp;0010 DS: 0000 ES: 0000 CR0: 0000000080050033</=
span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.432127] CR2: 0000000000000000 CR3: 00000010987ea000 CR4: 0000000=
0003506f0</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.440045] Call Trace:</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.443289] &nbsp;? tlbflush_read_file+0x70/0x70</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.448266] &nbsp;? tlbflush_read_file+0x70/0x70</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.453242] &nbsp;on_each_cpu+0x2b/0x60</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.457437] &nbsp;__purge_vmap_area_lazy+0x5d/0x680</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.462679] &nbsp;? _cond_resched+0x16/0x40</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.467224] &nbsp;? unmap_kernel_range_noflush+0x2fa/0x380</span></d=
iv>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.473072] &nbsp;free_vmap_area_noflush+0xe7/0x100</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.478315] &nbsp;remove_vm_area+0x96/0xa0</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.482770] &nbsp;__vunmap+0x8d/0x290</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.486792] &nbsp;drm_gem_shmem_vunmap+0x8b/0xa0 [drm]</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.492299] &nbsp;drm_client_buffer_vunmap+0x16/0x20 [drm]</span></d=
iv>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.498144] &nbsp;drm_fb_helper_dirty_work+0x187/0x1b0 [drm_kms_help=
er]</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.505118] &nbsp;process_one_work+0x1b6/0x350</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.509912] &nbsp;worker_thread+0x53/0x3e0</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.514361] &nbsp;? process_one_work+0x350/0x350</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.519338] &nbsp;kthread+0x11b/0x140</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp;467.523342] &nbsp;? __kthread_bind_mask+0x60/0x60</span></div>
</div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">[ &nbsp;467.528389] &nbsp;ret_from_fork+0x22/0x30</=
span><br>
</div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">Cheers</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">Karim</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ralf Ramsauer &lt;ral=
f.ramsauer@oth-regensburg.de&gt;<br>
<b>Sent:</b> 12 November 2022 17:47<br>
<b>To:</b> Karim Manaouil &lt;Karim.Manaouil@ed.ac.uk&gt;; jan.kiszka@sieme=
ns.com &lt;jan.kiszka@siemens.com&gt;<br>
<b>Cc:</b> jailhouse-dev@googlegroups.com &lt;jailhouse-dev@googlegroups.co=
m&gt;<br>
<b>Subject:</b> Re: Jailhouse: enter_hypervisor returns -ENOMEM</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This email was sent to you by someone outside the =
University.<br>
You should only click on links or attachments if you are certain that the e=
mail is genuine and the content is safe.<br>
<br>
On 12/11/2022 18:15, Karim Manaouil wrote:<br>
&gt; Hi Jan,<br>
&gt;<br>
&gt; I am trying to deploy Jailhouse on an AMD EPYC with 128 CPUs (8 NUMA<b=
r>
&gt; nodes), running Linux kernel v5.10 (same version used by jailhouse CI<=
br>
&gt; with same patches applied).<br>
&gt;<br>
&gt; `jailhouse hardware check` return that everything is ok and that &quot=
;Check<br>
&gt; passed!&quot;.<br>
&gt;<br>
&gt; Memory was reserved via `memmap=3D0x5200000$0x3a000000`<br>
&gt;<br>
&gt; However, enter_hypervisor() [1] fails when entry() is called on every<=
br>
&gt; cpu and return -ENOMEM as error_code.<br>
<br>
Try to reserve more memory. Maybe the default size of 6MiB for HV memory<br=
>
is insufficient for 128 CPUs.<br>
<br>
Did you use jailhouse-config-create? You can use the --mem-hv option to<br>
increate the memory. Try, for example, 32MiB and see if it works.<br>
<br>
&nbsp;&nbsp; Ralf<br>
<br>
&gt;<br>
&gt; Do you possibly know where could the issue come from?<br>
&gt;<br>
&gt; Best<br>
&gt; Karim<br>
&gt;<br>
&gt; [1]<br>
&gt; <a href=3D"https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be=
8a0918b9bef6e2cbd99f9fc/driver/main.c#L251">
https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cb=
d99f9fc/driver/main.c#L251</a> &lt;<a href=3D"https://github.com/siemens/ja=
ilhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251">h=
ttps://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd=
99f9fc/driver/main.c#L251</a>&gt;<br>
&gt;<br>
&gt; The University of Edinburgh is a charitable body, registered in<br>
&gt; Scotland, with registration number SC005336. Is e buidheann carthannai=
s<br>
&gt; a th=E2=80=99 ann an Oilthigh Dh=C3=B9n =C3=88ideann, cl=C3=A0raichte =
an Alba, =C3=A0ireamh cl=C3=A0raidh<br>
&gt; SC005336.<br>
&gt;<br>
&gt; --<br>
&gt; You received this message because you are subscribed to the Google<br>
&gt; Groups &quot;Jailhouse&quot; group.<br>
&gt; To unsubscribe from this group and stop receiving emails from it, send=
<br>
&gt; an email to jailhouse-dev+unsubscribe@googlegroups.com<br>
&gt; &lt;<a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">mail=
to:jailhouse-dev+unsubscribe@googlegroups.com</a>&gt;.<br>
&gt; To view this discussion on the web visit<br>
&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB60=
18F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com">
https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C=
697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com</a> &lt;<a href=3D"ht=
tps://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C69=
7CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com?utm_medium=3Demail&amp;=
utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse-dev/AM0PR0=
5MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com?=
utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.<br>
</div>
</span></font></div>
</body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/AM0PR05MB601899CAC211F4C81A9757DFA9029%40AM0PR05MB=
6018.eurprd05.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB601899CAC211F4C81A9757=
DFA9029%40AM0PR05MB6018.eurprd05.prod.outlook.com</a>.<br />

--_000_AM0PR05MB601899CAC211F4C81A9757DFA9029AM0PR05MB6018eurp_--

--_004_AM0PR05MB601899CAC211F4C81A9757DFA9029AM0PR05MB6018eurp_
Content-Type: text/plain; name="jailhouse_dmesg.txt"
Content-Description: jailhouse_dmesg.txt
Content-Disposition: attachment; filename="jailhouse_dmesg.txt"; size=31625;
	creation-date="Sun, 13 Nov 2022 22:22:42 GMT";
	modification-date="Sun, 13 Nov 2022 22:22:46 GMT"
Content-Transfer-Encoding: base64

WyAgNDM0Ljc5MjAwOF0gVGhlIEphaWxob3VzZSBpcyBvcGVuaW5nLgpbICA0NTUuNzg3MzE1XSBy
Y3U6IElORk86IHJjdV9zY2hlZCBkZXRlY3RlZCBzdGFsbHMgb24gQ1BVcy90YXNrczoKWyAgNDU1
Ljc5MzMwM10gcmN1OiAgICAgMS0uLi4wOiAoODM5IEdQcyBiZWhpbmQpIGlkbGU9YzJhLzEvMHg0
MDAwMDAwMDAwMDAwMDAwIHNvZnRpcnE9NjgxLzY4MSBmcXM9MTgyNwpbICA0NTUuODAyMjkyXSBy
Y3U6ICAgICAyLS4uLjA6ICgxNDQgR1BzIGJlaGluZCkgaWRsZT04MTIvMS8weDQwMDAwMDAwMDAw
MDAwMDAgc29mdGlycT05MDUvOTA1IGZxcz0xODI3ClsgIDQ1NS44MTEyNzZdIHJjdTogICAgIDMt
Li4uMDogKDE0NCBHUHMgYmVoaW5kKSBpZGxlPWVhYS8xLzB4NDAwMDAwMDAwMDAwMDAwMCBzb2Z0
aXJxPTcxOS83MTkgZnFzPTE4MjcKWyAgNDU1LjgyMDI2Nl0gcmN1OiAgICAgNC0uLi4wOiAoMSBH
UHMgYmVoaW5kKSBpZGxlPWMyZS8xLzB4NDAwMDAwMDAwMDAwMDAwMCBzb2Z0aXJxPTEzMjQvMTMy
NCBmcXM9MTgyNwpbICA0NTUuODI5MjUyXSByY3U6ICAgICA1LS4uLjA6ICgxNDQgR1BzIGJlaGlu
ZCkgaWRsZT00MWEvMS8weDQwMDAwMDAwMDAwMDAwMDAgc29mdGlycT01NTYvNTU2IGZxcz0xODI3
ClsgIDQ1NS44MzgyMzhdIHJjdTogICAgIDYtLi4uMDogKDE0NCBHUHMgYmVoaW5kKSBpZGxlPTkx
Mi8xLzB4NDAwMDAwMDAwMDAwMDAwMCBzb2Z0aXJxPTc3Ny83NzcgZnFzPTE4MjcKWyAgNDU1Ljg0
NzIxOF0gcmN1OiAgICAgNy0uLi4wOiAoMTQ0IEdQcyBiZWhpbmQpIGlkbGU9NWU2LzEvMHg0MDAw
MDAwMDAwMDAwMDAwIHNvZnRpcnE9MjQwOS8yNDEwIGZxcz0xODI3ClsgIDQ1NS44NTY0MDRdICAo
ZGV0ZWN0ZWQgYnkgODcsIHQ9NTI1MyBqaWZmaWVzLCBnPTQ4NTM3LCBxPTM2NCkKWyAgNDU1Ljg2
MjE3MF0gU2VuZGluZyBOTUkgZnJvbSBDUFUgODcgdG8gQ1BVcyAxOgpbICA0NjUuNzc2ODg0XSBT
ZW5kaW5nIE5NSSBmcm9tIENQVSA4NyB0byBDUFVzIDI6ClsgIDQ2Ny4xODI2ODZdIHdhdGNoZG9n
OiBCVUc6IHNvZnQgbG9ja3VwIC0gQ1BVIzAgc3R1Y2sgZm9yIDIzcyEgW2t3b3JrZXIvMDoxOjdd
ClsgIDQ2Ny4xODk4NTddIE1vZHVsZXMgbGlua2VkIGluOiBqYWlsaG91c2UoTykgbmZfY29ubnRy
YWNrX25ldGxpbmsgeGZybV91c2VyIHh0X2FkZHJ0eXBlIGJyX25ldGZpbHRlciB4dF9DSEVDS1NV
TSB4dF9NQVNRVUVSQURFIHh0X2Nvbm50cmFjayBpcHRfUkVKRUNUIG5mX3JlamVjdF9pcHY0IHh0
X3RjcHVkcCBuZnRfY29tcGF0IG5mdF9jaGFpbl9uYXQgbmZfbmF0cApbICA0NjcuMTg5OTI4XSAg
YmluZm10X21pc2MgY29uZmlnZnMgZWZpdmFyZnMgaXBfdGFibGVzIHhfdGFibGVzIGF1dG9mczQg
ZXh0NCBjcmMxNiBtYmNhY2hlIGpiZDIgcmFpZDEwIHJhaWQ0NTYgbGliY3JjMzJjIGNyYzMyY19n
ZW5lcmljIGFzeW5jX3JhaWQ2X3JlY292IGFzeW5jX21lbWNweSBhc3luY19wcSBhc3luY194b3Ig
eG9yIGFzeW5jX3R4IHJhaWQ2X3BxIF0KWyAgNDY3LjMyMDU2N10gQ1BVOiAwIFBJRDogNyBDb21t
OiBrd29ya2VyLzA6MSBUYWludGVkOiBHICAgICAgICAgICBPICAgICAgNS4xMC4wICMzClsgIDQ2
Ny4zMjg3NjddIEhhcmR3YXJlIG5hbWU6IERlbGwgSW5jLiBQb3dlckVkZ2UgUjc0MjUvMDhWMDAx
LCBCSU9TIDEuMTUuMCAwOS8xMS8yMDIwClsgIDQ2Ny4zMzcxNTRdIFdvcmtxdWV1ZTogZXZlbnRz
IGRybV9mYl9oZWxwZXJfZGlydHlfd29yayBbZHJtX2ttc19oZWxwZXJdClsgIDQ2Ny4zNDQ1MDFd
IFJJUDogMDAxMDpzbXBfY2FsbF9mdW5jdGlvbl9tYW55X2NvbmQrMHgyODkvMHgyZDAKWyAgNDY3
LjM1MDk3OV0gQ29kZTogZTggMWMgOGEgMzkgMDAgM2IgMDUgMGEgYzEgNzQgMDEgODkgYzcgMGYg
ODMgMGIgZmUgZmYgZmYgNDggNjMgYzcgNDkgOGIgMTYgNDggMDMgMTQgYzUgMDAgZDkgOTkgOWMg
OGIgNDIgMDggYTggMDEgNzQgMDkgZjMgOTAgPDhiPiA0MiAwOCBhOCAwMSA3NSBmNyBlYiBjOSA0
OCBjNyBjMiAyMCBjZiAwNyA5ZCA0YyA4OSBmZSA0NCA3ClsgIDQ2Ny4zNzEyMzJdIFJTUDogMDAx
ODpmZmZmYTdkNzgwMTVmY2Q4IEVGTEFHUzogMDAwMDAyMDIKWyAgNDY3LjM3NzIyMF0gUkFYOiAw
MDAwMDAwMDAwMDAwMDExIFJCWDogMDAwMDAwMDAwMDAzMTI4MCBSQ1g6IDAwMDAwMDAwMDAwMDAw
MDEKWyAgNDY3LjM4NTEyM10gUkRYOiBmZmZmOTY0ZjFmYTMxMjgwIFJTSTogMDAwMDAwMDAwMDAw
MDAwMCBSREk6IDAwMDAwMDAwMDAwMDAwMDEKWyAgNDY3LjM5MzAyNF0gUkJQOiAwMDAwMDAwMDAw
MDAwMDAwIFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IDAwMDAwMDAwMDAwMDAwMDEKWyAgNDY3
LjQwMDkyOF0gUjEwOiAwMDAwMDAwMDAwMDAwMDAyIFIxMTogMDAwMDAwMDAwMDAwMDAwMiBSMTI6
IDAwMDAwMDAwMDAwMDAwMDAKWyAgNDY3LjQwODgzNl0gUjEzOiAwMDAwMDAwMDAwMDAwMDdmIFIx
NDogZmZmZjk2MmYxZjQyYzljMCBSMTU6IDAwMDAwMDAwMDAwMDAwODAKWyAgNDY3LjQxNjczN10g
RlM6ICAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZmZmY5NjJmMWY0MDAwMDAoMDAwMCkga25s
R1M6MDAwMDAwMDAwMDAwMDAwMApbICA0NjcuNDI1NjA0XSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6
IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzClsgIDQ2Ny40MzIxMjddIENSMjogMDAwMDAwMDAw
MDAwMDAwMCBDUjM6IDAwMDAwMDEwOTg3ZWEwMDAgQ1I0OiAwMDAwMDAwMDAwMzUwNmYwClsgIDQ2
Ny40NDAwNDVdIENhbGwgVHJhY2U6ClsgIDQ2Ny40NDMyODldICA/IHRsYmZsdXNoX3JlYWRfZmls
ZSsweDcwLzB4NzAKWyAgNDY3LjQ0ODI2Nl0gID8gdGxiZmx1c2hfcmVhZF9maWxlKzB4NzAvMHg3
MApbICA0NjcuNDUzMjQyXSAgb25fZWFjaF9jcHUrMHgyYi8weDYwClsgIDQ2Ny40NTc0MzddICBf
X3B1cmdlX3ZtYXBfYXJlYV9sYXp5KzB4NWQvMHg2ODAKWyAgNDY3LjQ2MjY3OV0gID8gX2NvbmRf
cmVzY2hlZCsweDE2LzB4NDAKWyAgNDY3LjQ2NzIyNF0gID8gdW5tYXBfa2VybmVsX3JhbmdlX25v
Zmx1c2grMHgyZmEvMHgzODAKWyAgNDY3LjQ3MzA3Ml0gIGZyZWVfdm1hcF9hcmVhX25vZmx1c2gr
MHhlNy8weDEwMApbICA0NjcuNDc4MzE1XSAgcmVtb3ZlX3ZtX2FyZWErMHg5Ni8weGEwClsgIDQ2
Ny40ODI3NzBdICBfX3Z1bm1hcCsweDhkLzB4MjkwClsgIDQ2Ny40ODY3OTJdICBkcm1fZ2VtX3No
bWVtX3Z1bm1hcCsweDhiLzB4YTAgW2RybV0KWyAgNDY3LjQ5MjI5OV0gIGRybV9jbGllbnRfYnVm
ZmVyX3Z1bm1hcCsweDE2LzB4MjAgW2RybV0KWyAgNDY3LjQ5ODE0NF0gIGRybV9mYl9oZWxwZXJf
ZGlydHlfd29yaysweDE4Ny8weDFiMCBbZHJtX2ttc19oZWxwZXJdClsgIDQ2Ny41MDUxMThdICBw
cm9jZXNzX29uZV93b3JrKzB4MWI2LzB4MzUwClsgIDQ2Ny41MDk5MTJdICB3b3JrZXJfdGhyZWFk
KzB4NTMvMHgzZTAKWyAgNDY3LjUxNDM2MV0gID8gcHJvY2Vzc19vbmVfd29yaysweDM1MC8weDM1
MApbICA0NjcuNTE5MzM4XSAga3RocmVhZCsweDExYi8weDE0MApbICA0NjcuNTIzMzQyXSAgPyBf
X2t0aHJlYWRfYmluZF9tYXNrKzB4NjAvMHg2MApbICA0NjcuNTI4Mzg5XSAgcmV0X2Zyb21fZm9y
aysweDIyLzB4MzAKWyAgNDc1LjY4OTk5MF0gU2VuZGluZyBOTUkgZnJvbSBDUFUgODcgdG8gQ1BV
cyAzOgpbICA0ODUuNjA0Mzk5XSBTZW5kaW5nIE5NSSBmcm9tIENQVSA4NyB0byBDUFVzIDQ6Clsg
IDQ5NS4xODI3OThdIHdhdGNoZG9nOiBCVUc6IHNvZnQgbG9ja3VwIC0gQ1BVIzAgc3R1Y2sgZm9y
IDIzcyEgW2t3b3JrZXIvMDoxOjddClsgIDQ5NS4xOTExNzldIE1vZHVsZXMgbGlua2VkIGluOiBq
YWlsaG91c2UoTykgbmZfY29ubnRyYWNrX25ldGxpbmsgeGZybV91c2VyIHh0X2FkZHJ0eXBlIGJy
X25ldGZpbHRlciB4dF9DSEVDS1NVTSB4dF9NQVNRVUVSQURFIHh0X2Nvbm50cmFjayBpcHRfUkVK
RUNUIG5mX3JlamVjdF9pcHY0IHh0X3RjcHVkcCBuZnRfY29tcGF0IG5mdF9jaGFpbl9uYXQgbmZf
bmF0cApbICA0OTUuMTkxMjM5XSAgYmluZm10X21pc2MgY29uZmlnZnMgZWZpdmFyZnMgaXBfdGFi
bGVzIHhfdGFibGVzIGF1dG9mczQgZXh0NCBjcmMxNiBtYmNhY2hlIGpiZDIgcmFpZDEwIHJhaWQ0
NTYgbGliY3JjMzJjIGNyYzMyY19nZW5lcmljIGFzeW5jX3JhaWQ2X3JlY292IGFzeW5jX21lbWNw
eSBhc3luY19wcSBhc3luY194b3IgeG9yIGFzeW5jX3R4IHJhaWQ2X3BxIF0KWyAgNDk1LjMyNjM1
NF0gQ1BVOiAwIFBJRDogNyBDb21tOiBrd29ya2VyLzA6MSBUYWludGVkOiBHICAgICAgICAgICBP
IEwgICAgNS4xMC4wICMzClsgIDQ5NS4zMzQ2MjldIEhhcmR3YXJlIG5hbWU6IERlbGwgSW5jLiBQ
b3dlckVkZ2UgUjc0MjUvMDhWMDAxLCBCSU9TIDEuMTUuMCAwOS8xMS8yMDIwClsgIDQ5NS4zNDMw
NzddIFdvcmtxdWV1ZTogZXZlbnRzIGRybV9mYl9oZWxwZXJfZGlydHlfd29yayBbZHJtX2ttc19o
ZWxwZXJdClsgIDQ5NS4zNTA0ODVdIFJJUDogMDAxMDpzbXBfY2FsbF9mdW5jdGlvbl9tYW55X2Nv
bmQrMHgyOGMvMHgyZDAKWyAgNDk1LjM1NzAxMV0gQ29kZTogMzkgMDAgM2IgMDUgMGEgYzEgNzQg
MDEgODkgYzcgMGYgODMgMGIgZmUgZmYgZmYgNDggNjMgYzcgNDkgOGIgMTYgNDggMDMgMTQgYzUg
MDAgZDkgOTkgOWMgOGIgNDIgMDggYTggMDEgNzQgMDkgZjMgOTAgOGIgNDIgMDggPGE4PiAwMSA3
NSBmNyBlYiBjOSA0OCBjNyBjMiAyMCBjZiAwNyA5ZCA0YyA4OSBmZSA0NCA4OSBmNyBlOCBhClsg
IDQ5NS4zNzczMDddIFJTUDogMDAxODpmZmZmYTdkNzgwMTVmY2Q4IEVGTEFHUzogMDAwMDAyMDIK
WyAgNDk1LjM4MzMwN10gUkFYOiAwMDAwMDAwMDAwMDAwMDExIFJCWDogMDAwMDAwMDAwMDAzMTI4
MCBSQ1g6IDAwMDAwMDAwMDAwMDAwMDEKWyAgNDk1LjM5MTI1OF0gUkRYOiBmZmZmOTY0ZjFmYTMx
MjgwIFJTSTogMDAwMDAwMDAwMDAwMDAwMCBSREk6IDAwMDAwMDAwMDAwMDAwMDEKWyAgNDk1LjM5
OTIwOV0gUkJQOiAwMDAwMDAwMDAwMDAwMDAwIFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IDAw
MDAwMDAwMDAwMDAwMDEKWyAgNDk1LjQwNzE1Nl0gUjEwOiAwMDAwMDAwMDAwMDAwMDAyIFIxMTog
MDAwMDAwMDAwMDAwMDAwMiBSMTI6IDAwMDAwMDAwMDAwMDAwMDAKWyAgNDk1LjQxNTA4NF0gUjEz
OiAwMDAwMDAwMDAwMDAwMDdmIFIxNDogZmZmZjk2MmYxZjQyYzljMCBSMTU6IDAwMDAwMDAwMDAw
MDAwODAKWyAgNDk1LjQyMzAwM10gRlM6ICAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZmZmY5
NjJmMWY0MDAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMApbICA0OTUuNDMxODcwXSBD
UzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzClsgIDQ5NS40
MzgzODFdIENSMjogMDAwMDAwMDAwMDAwMDAwMCBDUjM6IDAwMDAwMDEwOTg3ZWEwMDAgQ1I0OiAw
MDAwMDAwMDAwMzUwNmYwClsgIDQ5NS40NDYyODddIENhbGwgVHJhY2U6ClsgIDQ5NS40NDk1MzJd
ICA/IHRsYmZsdXNoX3JlYWRfZmlsZSsweDcwLzB4NzAKWyAgNDk1LjQ1NDUyNV0gID8gdGxiZmx1
c2hfcmVhZF9maWxlKzB4NzAvMHg3MApbICA0OTUuNDU5NTA2XSAgb25fZWFjaF9jcHUrMHgyYi8w
eDYwClsgIDQ5NS40NjM2ODRdICBfX3B1cmdlX3ZtYXBfYXJlYV9sYXp5KzB4NWQvMHg2ODAKWyAg
NDk1LjQ2ODkwNl0gID8gX2NvbmRfcmVzY2hlZCsweDE2LzB4NDAKWyAgNDk1LjQ3MzQyNF0gID8g
dW5tYXBfa2VybmVsX3JhbmdlX25vZmx1c2grMHgyZmEvMHgzODAKWyAgNDk1LjQ3OTI1NF0gIGZy
ZWVfdm1hcF9hcmVhX25vZmx1c2grMHhlNy8weDEwMApbICA0OTUuNDg0NDc1XSAgcmVtb3ZlX3Zt
X2FyZWErMHg5Ni8weGEwClsgIDQ5NS40ODg5MTZdICBfX3Z1bm1hcCsweDhkLzB4MjkwClsgIDQ5
NS40OTI5MzBdICBkcm1fZ2VtX3NobWVtX3Z1bm1hcCsweDhiLzB4YTAgW2RybV0KWyAgNDk1LjQ5
ODQxNl0gIGRybV9jbGllbnRfYnVmZmVyX3Z1bm1hcCsweDE2LzB4MjAgW2RybV0KWyAgNDk1LjUw
NDIzOF0gIGRybV9mYl9oZWxwZXJfZGlydHlfd29yaysweDE4Ny8weDFiMCBbZHJtX2ttc19oZWxw
ZXJdClsgIDQ5NS41MTExOTJdICBwcm9jZXNzX29uZV93b3JrKzB4MWI2LzB4MzUwClsgIDQ5NS41
MTU5NzZdICB3b3JrZXJfdGhyZWFkKzB4NTMvMHgzZTAKWyAgNDk1LjUxODQxMF0gU2VuZGluZyBO
TUkgZnJvbSBDUFUgODcgdG8gQ1BVcyA1OgpbICA0OTUuNTIwNDE1XSAgPyBwcm9jZXNzX29uZV93
b3JrKzB4MzUwLzB4MzUwClsgIDQ5NS41MjA0MjBdICBrdGhyZWFkKzB4MTFiLzB4MTQwClsgIDQ5
NS41MzU5NTZdICA/IF9fa3RocmVhZF9iaW5kX21hc2srMHg2MC8weDYwClsgIDQ5NS41NDExMTFd
ICByZXRfZnJvbV9mb3JrKzB4MjIvMHgzMApbICA1MDUuNDM0ODYzXSBTZW5kaW5nIE5NSSBmcm9t
IENQVSA4NyB0byBDUFVzIDY6ClsgIDUxNS4zNDkxOTddIFNlbmRpbmcgTk1JIGZyb20gQ1BVIDg3
IHRvIENQVXMgNzoKWyAgNTE4Ljg0NzU1OV0gcmN1OiBJTkZPOiByY3Vfc2NoZWQgZGV0ZWN0ZWQg
c3RhbGxzIG9uIENQVXMvdGFza3M6ClsgIDUyNS4yNjMxNzZdIHJjdTogcmN1X3NjaGVkIGt0aHJl
YWQgc3RhcnZlZCBmb3IgMTcxNjcgamlmZmllcyEgZzQ4NTM3IGYweDAgUkNVX0dQX0RPSU5HX0ZR
Uyg2KSAtPnN0YXRlPTB4MCAtPmNwdT00OApbICA1MjUuMjYzMTgxXSByY3U6ICAgICAxLS4uLjA6
ICg4MzkgR1BzIGJlaGluZCkgaWRsZT1jMmEvMS8weDQwMDAwMDAwMDAwMDAwMDAgc29mdGlycT02
ODEvNjgxIGZxcz0xODI4ClsgIDUyNS4yNjMxODddIHJjdTogICAgIDItLi4uMDogKDE0NCBHUHMg
YmVoaW5kKSBpZGxlPTgxMi8xLzB4NDAwMDAwMDAwMDAwMDAwMCBzb2Z0aXJxPTkwNS85MDUgZnFz
PTE4MjgKWyAgNTI1LjI2MzE5MF0gd2F0Y2hkb2c6IEJVRzogc29mdCBsb2NrdXAgLSBDUFUjNDgg
c3R1Y2sgZm9yIDY2cyEgW3JjdV9zY2hlZDoxMl0KWyAgNTI1LjI2MzE5MV0gTW9kdWxlcyBsaW5r
ZWQgaW46IGphaWxob3VzZShPKSBuZl9jb25udHJhY2tfbmV0bGluayB4ZnJtX3VzZXIgeHRfYWRk
cnR5cGUgYnJfbmV0ZmlsdGVyIHh0X0NIRUNLU1VNIHh0X01BU1FVRVJBREUgeHRfY29ubnRyYWNr
IGlwdF9SRUpFQ1QgbmZfcmVqZWN0X2lwdjQgeHRfdGNwdWRwIG5mdF9jb21wYXQgbmZ0X2NoYWlu
X25hdCBuZl9uYXRwClsgIDUyNS4yNjMyMzRdICBiaW5mbXRfbWlzYyBjb25maWdmcyBlZml2YXJm
cyBpcF90YWJsZXMgeF90YWJsZXMgYXV0b2ZzNCBleHQ0IGNyYzE2IG1iY2FjaGUgamJkMiByYWlk
MTAgcmFpZDQ1NiBsaWJjcmMzMmMgY3JjMzJjX2dlbmVyaWMgYXN5bmNfcmFpZDZfcmVjb3YgYXN5
bmNfbWVtY3B5IGFzeW5jX3BxIGFzeW5jX3hvciB4b3IgYXN5bmNfdHggcmFpZDZfcHEgXQpbICA1
MjUuMjYzMjUwXSBDUFU6IDQ4IFBJRDogMTIgQ29tbTogcmN1X3NjaGVkIFRhaW50ZWQ6IEcgICAg
ICAgICAgIE8gTCAgICA1LjEwLjAgIzMKWyAgNTI1LjI2MzI1Ml0gSGFyZHdhcmUgbmFtZTogRGVs
bCBJbmMuIFBvd2VyRWRnZSBSNzQyNS8wOFYwMDEsIEJJT1MgMS4xNS4wIDA5LzExLzIwMjAKWyAg
NTI1LjI2MzI1NV0gUklQOiAwMDEwOl9yYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSsweDExLzB4
MjAKWyAgNTI1LjI2MzI1OF0gQ29kZTogZTAgNGMgMzkgZjAgNzYgZDggODAgNGQgMDAgMDQgZWIg
OTIgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgMGYgMWYgNDQgMDAgMDAg
YzYgMDcgMDAgMGYgMWYgNDAgMDAgNDggODkgZjcgNTcgOWQgPDBmPiAxZiA0NCAwMCAwMCBjMyA2
NiAwZiAxZiA4NCAwMCAwMCAwMCAwMCAwMCAwZiAxZiA0NCAwMCAwMCA3ClsgIDUyNS4yNjMyNTld
IFJTUDogMDAxODpmZmZmYTdkNzgwMjBmZTYwIEVGTEFHUzogMDAwMDAyNDYKWyAgNTI1LjI2MzI2
MV0gUkFYOiAwMDAwMDAwMDAwMDAwMDQwIFJCWDogZmZmZmZmZmY5Y2VkMzI4MCBSQ1g6IDAwMDAw
MDAwMDAwMDAwNDAKWyAgNTI1LjI2MzI2Ml0gUkRYOiAwMDAwMDAwMDAwMDAwMGZlIFJTSTogMDAw
MDAwMDAwMDAwMDI0NiBSREk6IDAwMDAwMDAwMDAwMDAyNDYKWyAgNTI1LjI2MzI2NF0gUkJQOiAw
MDAwMDAwMDAwMDAwMDAwIFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IDAwMDAwMDAwMDAwMDAw
NDAKWyAgNTI1LjI2MzI2NF0gUjEwOiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAw
MDAwMCBSMTI6IGZmZmZmZmZmOWNlZDMyYTAKWyAgNTI1LjI2MzI2NV0gUjEzOiAwMDAwMDAwMDAw
MDAwMDAwIFIxNDogMDAwMDAwMDAwMDAyYzc4MCBSMTU6IDAwMDAwMDAwMDAwMDAwNDAKWyAgNTI1
LjI2MzI2N10gRlM6ICAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZmZmY5NjJmMWY1ODAwMDAo
MDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMApbICA1MjUuMjYzMjY4XSBDUzogIDAwMTAgRFM6
IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzClsgIDUyNS4yNjMyNjldIENSMjog
MDAwMDAwMDAwMDAwMDAwMCBDUjM6IDAwMDAwMDAxMGUzMTIwMDAgQ1I0OiAwMDAwMDAwMDAwMzUw
NmUwClsgIDUyNS4yNjMyNjldIENhbGwgVHJhY2U6ClsgIDUyNS4yNjMyNzRdICBmb3JjZV9xc19y
bnArMHgxNzgvMHgxOTAKWyAgNTI1LjI2MzI3Nl0gID8ga2ZyZWVfcmN1X3Nocmlua19jb3VudCsw
eDUwLzB4NTAKWyAgNTI1LjI2MzI3OF0gIHJjdV9ncF9rdGhyZWFkKzB4NTljLzB4YTcwClsgIDUy
NS4yNjMyODBdICA/IHJjdV9jcHVfa3RocmVhZCsweDE5MC8weDE5MApbICA1MjUuMjYzMjgyXSAg
a3RocmVhZCsweDExYi8weDE0MApbICA1MjUuMjYzMjgzXSAgPyBfX2t0aHJlYWRfYmluZF9tYXNr
KzB4NjAvMHg2MApbICA1MjUuMjYzMjg1XSAgcmV0X2Zyb21fZm9yaysweDIyLzB4MzAKWyAgNTI1
LjI3NDc5MV0gcmN1OiAgICAgVW5sZXNzIHJjdV9zY2hlZCBrdGhyZWFkIGdldHMgc3VmZmljaWVu
dCBDUFUgdGltZSwgT09NIGlzIG5vdyBleHBlY3RlZCBiZWhhdmlvci4KWyAgNTI1LjI3NDc5Nl0g
cmN1OiBSQ1UgZ3JhY2UtcGVyaW9kIGt0aHJlYWQgc3RhY2sgZHVtcDoKWyAgNTI1LjI4NDk2Ml0g
cmN1OiAgICAgMy0uLi4wOiAoMTQ0IEdQcyBiZWhpbmQpIGlkbGU9ZWFhLzEvMHg0MDAwMDAwMDAw
MDAwMDAwIHNvZnRpcnE9NzE5LzcxOSBmcXM9MTgyOQpbICA1MjUuMjk1MTI4XSB0YXNrOnJjdV9z
Y2hlZCAgICAgICBzdGF0ZTpSICBydW5uaW5nIHRhc2sKWyAgNTI1LjMwMzQ3M10gcmN1OiAgICAg
NC0uLi4wOiAoMSBHUHMgYmVoaW5kKSBpZGxlPWMyZS8xLzB4NDAwMDAwMDAwMDAwMDAwMCBzb2Z0
aXJxPTEzMjQvMTMyNCBmcXM9MTgyOQpbICA1MjUuMzAzNDgwXSByY3U6ICAgICA1LS4uLjA6ICgx
NDQgR1BzIGJlaGluZCkgaWRsZT00MWEvMS8weDQwMDAwMDAwMDAwMDAwMDAgc29mdGlycT01NTYv
NTU2IGZxcz0xODI5ClsgIDUyNS4zOTc4NTNdICBzdGFjazogICAgMCBwaWQ6ICAgMTIgcHBpZDog
ICAgIDIgZmxhZ3M6MHgwMDAwNDAwMApbICA1MjUuMzk3ODU4XSBDYWxsIFRyYWNlOgpbICA1MjUu
NDM5NzY2XSByY3U6ICAgICA2LS4uLjA6ICgxNDQgR1BzIGJlaGluZCkgaWRsZT05MTIvMS8weDQw
MDAwMDAwMDAwMDAwMDAgc29mdGlycT03NzcvNzc3IGZxcz0xODI5ClsgIDUyNS40Mzk3NzFdIHJj
dTogICAgIDctLi4uMDogKDE0NCBHUHMgYmVoaW5kKSBpZGxlPTVlNi8xLzB4NDAwMDAwMDAwMDAw
MDAwMCBzb2Z0aXJxPTI0MDkvMjQxMCBmcXM9MTgyOQpbICA1MjUuNDQ4NTcyXSAgPyBsb2NrX3Rp
bWVyX2Jhc2UrMHg2MS8weDgwClsgIDUyNS40NTc1MjBdICAoZGV0ZWN0ZWQgYnkgMCwgdD0yMjY1
MCBqaWZmaWVzLCBnPTQ4NTM3LCBxPTE1NzYpClsgIDUyNS40NjQzODVdICA/IHNjaGVkdWxlKzB4
NDYvMHhiMApbICA1MjUuNDY0Mzg5XSAgPyBzY2hlZHVsZV90aW1lb3V0KzB4OGIvMHgxNDAKWyAg
NTI1LjQ4NTQ1MF0gU2VuZGluZyBOTUkgZnJvbSBDUFUgMCB0byBDUFVzIDE6ClsgIDUyNS42OTk2
NjVdICA/IGZvcmNlX3FzX3JucCsweDZjLzB4MTkwClsgIDUyNS43MDQyMDZdICA/IGtmcmVlX3Jj
dV9zaHJpbmtfY291bnQrMHg1MC8weDUwClsgIDUyNS43MDk1MTNdICA/IHJjdV9ncF9rdGhyZWFk
KzB4NTljLzB4YTcwClsgIDUyNS43MTQyNzZdICA/IHJjdV9jcHVfa3RocmVhZCsweDE5MC8weDE5
MApbICA1MjUuNzE5MTEwXSAgPyBrdGhyZWFkKzB4MTFiLzB4MTQwClsgIDUyNS43MjMyMjhdICA/
IF9fa3RocmVhZF9iaW5kX21hc2srMHg2MC8weDYwClsgIDUyNS43MjgyMDBdICA/IHJldF9mcm9t
X2ZvcmsrMHgyMi8weDMwClsgIDUzNS40MTExMTldIFNlbmRpbmcgTk1JIGZyb20gQ1BVIDAgdG8g
Q1BVcyAyOgpbICA1NDUuMzQyMzI4XSBTZW5kaW5nIE5NSSBmcm9tIENQVSAwIHRvIENQVXMgMzoK
WyAgNTU1LjI3MzE4NV0gU2VuZGluZyBOTUkgZnJvbSBDUFUgMCB0byBDUFVzIDQ6ClsgIDU2NS4y
MDM5NTZdIFNlbmRpbmcgTk1JIGZyb20gQ1BVIDAgdG8gQ1BVcyA1OgpbICA1NzUuMTM0Njc5XSBT
ZW5kaW5nIE5NSSBmcm9tIENQVSAwIHRvIENQVXMgNjoKWyAgNTc5LjE4NDA1N10gd2F0Y2hkb2c6
IEJVRzogc29mdCBsb2NrdXAgLSBDUFUjNTAgc3R1Y2sgZm9yIDIycyEgW2RvY2tlcmQ6MzQyM10K
WyAgNTc5LjE4NDIwNF0gd2F0Y2hkb2c6IEJVRzogc29mdCBsb2NrdXAgLSBDUFUjNTggc3R1Y2sg
Zm9yIDIycyEgW2RvY2tlcmQ6MzQzMF0KWyAgNTc5LjE5MjA5NF0gTW9kdWxlcyBsaW5rZWQgaW46
ClsgIDU3OS4yMDAwOTBdIE1vZHVsZXMgbGlua2VkIGluOgpbICA1NzkuMjAwMDk1XSAgamFpbGhv
dXNlKE8pClsgIDU3OS4yMDM4MjFdICBqYWlsaG91c2UoTykKWyAgNTc5LjIwNzY2NV0gIG5mX2Nv
bm50cmFja19uZXRsaW5rClsgIDU3OS4yMTEwNDVdICBuZl9jb25udHJhY2tfbmV0bGluawpbICA1
NzkuMjE0NDIxXSAgeGZybV91c2VyClsgIDU3OS4yMTg1MDFdICB4ZnJtX3VzZXIKWyAgNTc5LjIy
MjU3Ml0gIHh0X2FkZHJ0eXBlClsgIDU3OS4yMjU2NzldICB4dF9hZGRydHlwZQpbICA1NzkuMjI4
NzY5XSAgYnJfbmV0ZmlsdGVyClsgIDU3OS4yMzIwMDddICBicl9uZXRmaWx0ZXIKWyAgNTc5LjIz
NTIxMV0gIHh0X0NIRUNLU1VNClsgIDU3OS4yMzg1MDBdICB4dF9DSEVDS1NVTQpbICA1NzkuMjQx
NzczXSAgeHRfTUFTUVVFUkFERSB4dF9jb25udHJhY2sKWyAgNTc5LjI0NDk2Ml0gIHh0X01BU1FV
RVJBREUKWyAgNTc5LjI0ODE0NF0gIGlwdF9SRUpFQ1QgbmZfcmVqZWN0X2lwdjQKWyAgNTc5LjI1
MjYzN10gIHh0X2Nvbm50cmFjawpbICA1NzkuMjU1OTkyXSAgeHRfdGNwdWRwClsgIDU3OS4yNjAz
OTddICBpcHRfUkVKRUNUClsgIDU3OS4yNjM2NjhdICBuZnRfY29tcGF0IG5mdF9jaGFpbl9uYXQK
WyAgNTc5LjI2NjY0M10gIG5mX3JlamVjdF9pcHY0ClsgIDU3OS4yNjk2ODVdICBuZl9uYXQKWyAg
NTc5LjI3MzkzNF0gIHh0X3RjcHVkcApbICA1NzkuMjc3MzA3XSAgbmZfY29ubnRyYWNrIG5mX2Rl
ZnJhZ19pcHY2ClsgIDU3OS4yNzk5NjNdICBuZnRfY29tcGF0IG5mdF9jaGFpbl9uYXQKWyAgNTc5
LjI4Mjg3M10gIG5mX2RlZnJhZ19pcHY0ClsgIDU3OS4yODczMjldICBuZl9uYXQgbmZfY29ubnRy
YWNrClsgIDU3OS4yOTE1MTddICBuZnRfY291bnRlcgpbICA1NzkuMjk0ODA3XSAgbmZfZGVmcmFn
X2lwdjYKWyAgNTc5LjI5ODUzM10gIG5mX3RhYmxlcyBuZm5ldGxpbmsKWyAgNTc5LjMwMTU0MF0g
IG5mX2RlZnJhZ19pcHY0ClsgIDU3OS4zMDQ3OTJdICBicmlkZ2UKWyAgNTc5LjMwODQ3MF0gIG5m
dF9jb3VudGVyClsgIDU3OS4zMTE3MTNdICBzdHAgbGxjClsgIDU3OS4zMTQyNjVdICBuZl90YWJs
ZXMKWyAgNTc5LjMxNzIzOV0gIGNwdWZyZXFfb25kZW1hbmQgY3B1ZnJlcV9jb25zZXJ2YXRpdmUK
WyAgNTc5LjMxOTg2OF0gIG5mbmV0bGluawpbICA1NzkuMzIyNjU3XSAgY3B1ZnJlcV9wb3dlcnNh
dmUgY3B1ZnJlcV91c2Vyc3BhY2UKWyAgNTc5LjMyNzg5MF0gIGJyaWRnZQpbICA1NzkuMzMwNjg5
XSAgbWx4NV9pYgpbICA1NzkuMzM1NzQ1XSAgc3RwIGxsYwpbICA1NzkuMzM4MjkwXSAgb3Zlcmxh
eSBtc3IKWyAgNTc5LjM0MDkwNV0gIGNwdWZyZXFfb25kZW1hbmQgY3B1ZnJlcV9jb25zZXJ2YXRp
dmUKWyAgNTc5LjM0MzUyMl0gIGVzcDZfb2ZmbG9hZApbICA1NzkuMzQ2NDg2XSAgY3B1ZnJlcV9w
b3dlcnNhdmUgY3B1ZnJlcV91c2Vyc3BhY2UKWyAgNTc5LjM1MTcyNl0gIGVzcDYgaWJfdXZlcmJz
ClsgIDU3OS4zNTQ4MDddICBtbHg1X2liClsgIDU3OS4zNTk4NDldICBlc3A0X29mZmxvYWQKWyAg
NTc5LjM2MzA3Ml0gIG92ZXJsYXkgbXNyClsgIDU3OS4zNjU2NzNdICBlc3A0IHhmcm1fYWxnbwpb
ICA1NzkuMzY4NzA4XSAgZXNwNl9vZmZsb2FkClsgIDU3OS4zNzE2NTFdICBpYl9jb3JlClsgIDU3
OS4zNzQ4NTBdICBlc3A2IGliX3V2ZXJicwpbICA1NzkuMzc3ODc2XSAgbWx4NV9jb3JlClsgIDU3
OS4zODA0ODBdICBlc3A0X29mZmxvYWQKWyAgNTc5LjM4MzY3Nl0gIGFtZDY0X2VkYWNfbW9kIGVk
YWNfbWNlX2FtZApbICA1NzkuMzg2NDQyXSAgZXNwNCB4ZnJtX2FsZ28KWyAgNTc5LjM4OTQ3NV0g
IG5sc19hc2NpaSBrdm1fYW1kClsgIDU3OS4zOTM4MTddICBpYl9jb3JlClsgIDU3OS4zOTcwMzJd
ICBubHNfY3A0MzcKWyAgNTc5LjQwMDUwOV0gIG1seDVfY29yZSBhbWQ2NF9lZGFjX21vZApbICA1
NzkuNDAzMTEzXSAgdmZhdCBmYXQKWyAgNTc5LjQwNTg5OF0gIGVkYWNfbWNlX2FtZCBubHNfYXNj
aWkKWyAgNTc5LjQwOTk4Nl0gIGt2bQpbICA1NzkuNDEyNjg1XSAga3ZtX2FtZApbICA1NzkuNDE2
NTg4XSAgc25kX3BjbSB4aGNpX3BjaQpbICA1NzkuNDE4ODUyXSAgbmxzX2NwNDM3IHZmYXQKWyAg
NTc5LjQyMTQ2MV0gIHhoY2lfaGNkClsgIDU3OS40MjQ4NTVdICBmYXQKWyAgNTc5LjQyODA2Ml0g
IHRnMwpbICA1NzkuNDMwNzQ2XSAga3ZtClsgIDU3OS40MzI5OThdICBibnh0X2VuClsgIDU3OS40
MzUyNDddICBzbmRfcGNtClsgIDU3OS40Mzc0NzVdICBldmRldiB1c2Jjb3JlClsgIDU3OS40NDAw
NjJdICB4aGNpX3BjaQpbICA1NzkuNDQyNjM1XSAgc25kX3RpbWVyIGlycWJ5cGFzcwpbICA1Nzku
NDQ1NzMyXSAgeGhjaV9oY2QKWyAgNTc5LjQ0ODM5M10gIGRjZGJhcwpbICA1NzkuNDUyMDE3XSAg
dGczClsgIDU3OS40NTQ2NzddICBjcmMzMl9wY2xtdWwgbnZtZQpbICA1NzkuNDU3MTcwXSAgYm54
dF9lbgpbICA1NzkuNDU5MzkxXSAgYWhjaQpbICA1NzkuNDYyODM1XSAgZXZkZXYKWyAgNTc5LjQ2
NTQxNF0gIGxpYnBoeSBzbmQKWyAgNTc5LjQ2NzczMF0gIHVzYmNvcmUKWyAgNTc5LjQ3MDExNF0g
IGdoYXNoX2NsbXVsbmlfaW50ZWwKWyAgNTc5LjQ3MjkyN10gIHNuZF90aW1lciBpcnFieXBhc3MK
WyAgNTc5LjQ3NTQ3NV0gIGlwbWlfc3NpZiBsaWJhaGNpClsgIDU3OS40NzkwNjVdICBkY2RiYXMg
Y3JjMzJfcGNsbXVsClsgIDU3OS40ODI2NjhdICBudm1lX2NvcmUKWyAgNTc5LjQ4NjA5MV0gIG52
bWUKWyAgNTc5LjQ4OTY4OF0gIGFlc25pX2ludGVsIG1seGZ3ClsgIDU3OS40OTI0MDddICBhaGNp
ClsgIDU3OS40OTQ2ODldICBjcnlwdG9fc2ltZApbICA1NzkuNDk4MDk1XSAgbGlicGh5ClsgIDU3
OS41MDAzNzJdICBzcDUxMDBfdGNvClsgIDU3OS41MDMyNTVdICBzbmQKWyAgNTc5LjUwNTY5OV0g
IHNvdW5kY29yZQpbICA1NzkuNTA4NDkzXSAgZ2hhc2hfY2xtdWxuaV9pbnRlbApbICA1NzkuNTEw
NjgzXSAgcHRwClsgIDU3OS41MTMzODJdICBpcG1pX3NzaWYgbGliYWhjaQpbICA1NzkuNTE2OTYw
XSAgbGliYXRhClsgIDU3OS41MTkxNTBdICBudm1lX2NvcmUgYWVzbmlfaW50ZWwKWyAgNTc5LjUy
MjU1Nl0gIGNjcApbICA1NzkuNTI1MDAyXSAgbWx4ZncKWyAgNTc5LjUyODc1Ml0gIGNyeXB0ZApb
ICA1NzkuNTMwOTMxXSAgY3J5cHRvX3NpbWQKWyAgNTc5LjUzMzI5MV0gIGdsdWVfaGVscGVyClsg
IDU3OS41MzU3MzRdICBzcDUxMDBfdGNvIHNvdW5kY29yZQpbICA1NzkuNTM4NjA1XSAgcHBzX2Nv
cmUgd2F0Y2hkb2cKWyAgNTc5LjU0MTQ3M10gIHB0cApbICA1NzkuNTQ1MTI3XSAgc2cKWyAgNTc5
LjU0ODUyNl0gIGxpYmF0YQpbICA1NzkuNTUwNzA0XSAgcGNzcGtyClsgIDU3OS41NTI3OTJdICBj
Y3AKWyAgNTc5LjU1NTIyM10gIHBjaV9oeXBlcnZfaW50ZiBhY3BpX2lwbWkKWyAgNTc5LjU1NzY1
OF0gIGNyeXB0ZApbICA1NzkuNTU5ODMxXSAgZWZpX3BzdG9yZQpbICA1NzkuNTYzOTE3XSAgZ2x1
ZV9oZWxwZXIKWyAgNTc5LjU2NjM2Nl0gIHJhcGwKWyAgNTc5LjU2OTE1N10gIHBwc19jb3JlIHdh
dGNoZG9nClsgIDU3OS41NzIwNDFdICBpMmNfcGlpeDQKWyAgNTc5LjU3NDMxM10gIHNnClsgIDU3
OS41Nzc3MTddICBybmdfY29yZSBrMTB0ZW1wClsgIDU3OS41ODA0MjZdICBwY3Nwa3IKWyAgNTc5
LjU4MjUyNF0gIGlwbWlfc2kgYWNwaV9wb3dlcl9tZXRlcgpbICA1NzkuNTg1ODQxXSAgcGNpX2h5
cGVydl9pbnRmIGFjcGlfaXBtaQpbICA1NzkuNTg4Mjk4XSAgaXBtaV9kZXZpbnRmClsgIDU3OS41
OTIzMTldICBlZmlfcHN0b3JlClsgIDU3OS41OTY0MjVdICBpcG1pX21zZ2hhbmRsZXIgYnV0dG9u
ClsgIDU3OS41OTk0MDhdICByYXBsClsgIDU3OS42MDIyMThdICBuZnNkClsgIDU3OS42MDYwNzdd
ICBpMmNfcGlpeDQKWyAgNTc5LjYwODM3MF0gIGF1dGhfcnBjZ3NzClsgIDU3OS42MTA2NjddICBy
bmdfY29yZSBrMTB0ZW1wClsgIDU3OS42MTMzOTBdICBuZnNfYWNsClsgIDU3OS42MTYyODRdICBp
cG1pX3NpIGFjcGlfcG93ZXJfbWV0ZXIKWyAgNTc5LjYxOTYxNl0gIGxvY2tkClsgIDU3OS42MjIx
NjBdICBpcG1pX2RldmludGYKWyAgNTc5LjYyNjE5MV0gIGdyYWNlClsgIDU3OS42Mjg1NzddICBp
cG1pX21zZ2hhbmRsZXIgYnV0dG9uClsgIDU3OS42MzE1NzJdICBzdW5ycGMKWyAgNTc5LjYzMzk1
Nl0gIG5mc2QKWyAgNTc5LjYzNzgxOF0gIHNjaF9mcSBmdXNlClsgIDU3OS42NDAyOTZdICBhdXRo
X3JwY2dzcwpbICA1NzkuNjQyNjAwXSAgdGNwX2h0Y3AKWyAgNTc5LjY0NTUwOF0gIG5mc19hY2wK
WyAgNTc5LjY0ODQyMF0gIGJpbmZtdF9taXNjIGNvbmZpZ2ZzClsgIDU3OS42NTEwNzFdICBsb2Nr
ZApbICA1NzkuNjUzNjI3XSAgZWZpdmFyZnMKWyAgNTc5LjY1NzMyMV0gIGdyYWNlClsgIDU3OS42
NTk3MTZdICBpcF90YWJsZXMKWyAgNTc5LjY2MjM1N10gIHN1bnJwYwpbICA1NzkuNjY0NzQxXSAg
eF90YWJsZXMKWyAgNTc5LjY2NzQ3Nl0gIHNjaF9mcSBmdXNlClsgIDU3OS42Njk5NTNdICBhdXRv
ZnM0ClsgIDU3OS42NzI1OTJdICB0Y3BfaHRjcApbICA1NzkuNjc1NDkyXSAgZXh0NCBjcmMxNgpb
ICA1NzkuNjc4MDQzXSAgYmluZm10X21pc2MgY29uZmlnZnMKWyAgNTc5LjY4MDY3NV0gIG1iY2Fj
aGUgamJkMgpbICA1NzkuNjgzNDg1XSAgZWZpdmFyZnMKWyAgNTc5LjY4NzE2OV0gIHJhaWQxMApb
ICA1NzkuNjkwMTYzXSAgaXBfdGFibGVzClsgIDU3OS42OTI4MDNdICByYWlkNDU2ClsgIDU3OS42
OTUyNzldICB4X3RhYmxlcwpbICA1NzkuNjk4MDA2XSAgbGliY3JjMzJjClsgIDU3OS43MDA1NTJd
ICBhdXRvZnM0ClsgIDU3OS43MDMxODddICBjcmMzMmNfZ2VuZXJpYwpbICA1NzkuNzA1OTA4XSAg
ZXh0NCBjcmMxNgpbICA1NzkuNzA4NDU4XSAgYXN5bmNfcmFpZDZfcmVjb3YKWyAgNTc5LjcxMTYx
MF0gIG1iY2FjaGUgamJkMgpbICA1NzkuNzE0NDE5XSAgYXN5bmNfbWVtY3B5ClsgIDU3OS43MTc4
MzldICByYWlkMTAKWyAgNTc5LjcyMDgzMF0gIGFzeW5jX3BxClsgIDU3OS43MjM4MjBdICByYWlk
NDU2ClsgIDU3OS43MjYyODRdICBhc3luY194b3IgeG9yClsgIDU3OS43Mjg5MDddICBsaWJjcmMz
MmMKWyAgNTc5LjczMTQ0Nl0gIGFzeW5jX3R4IHJhaWQ2X3BxClsgIDU3OS43MzQ1MDZdICBjcmMz
MmNfZ2VuZXJpYwpbICA1NzkuNzM3MjE5XSAgcmFpZDEKWyAgNTc5Ljc0MDYyN10gIGFzeW5jX3Jh
aWQ2X3JlY292ClsgIDU3OS43NDM3NzJdICByYWlkMApbICA1NzkuNzQ2MTM3XSAgYXN5bmNfbWVt
Y3B5ClsgIDU3OS43NDk1NDhdICBtdWx0aXBhdGgKWyAgNTc5Ljc1MTkxMF0gIGFzeW5jX3BxIGFz
eW5jX3hvcgpbICA1NzkuNzU0ODgzXSAgbGluZWFyIG1kX21vZApbICA1NzkuNzU3NTg0XSAgeG9y
ClsgIDU3OS43NjEwNzFdICBzZF9tb2QKWyAgNTc5Ljc2NDEyNl0gIGFzeW5jX3R4IHJhaWQ2X3Bx
ClsgIDU3OS43NjYzMTVdICB0MTBfcGkgY3JjX3QxMGRpZgpbICA1NzkuNzY4NzYwXSAgcmFpZDEK
WyAgNTc5Ljc3MjE1NV0gIGNyY3QxMGRpZl9nZW5lcmljClsgIDU3OS43NzU1NTRdICByYWlkMApb
ICA1NzkuNzc3OTA4XSAgbWdhZzIwMApbICA1NzkuNzgxMzExXSAgbXVsdGlwYXRoClsgIDU3OS43
ODM2NjVdICBkcm1fa21zX2hlbHBlcgpbICA1NzkuNzg2MTk0XSAgbGluZWFyIG1kX21vZApbICA1
NzkuNzg4ODk4XSAgY2VjClsgIDU3OS43OTIwMzFdICBzZF9tb2QKWyAgNTc5Ljc5NTA4MF0gIHJj
X2NvcmUKWyAgNTc5Ljc5NzI2Ml0gIHQxMF9waSBjcmNfdDEwZGlmClsgIDU3OS43OTk3MDJdICBk
cm0KWyAgNTc5LjgwMjIyN10gIGNyY3QxMGRpZl9nZW5lcmljIG1nYWcyMDAKWyAgNTc5LjgwNTYy
OV0gIG1lZ2FyYWlkX3NhcyBzY3NpX21vZApbICA1NzkuODA3ODEyXSAgZHJtX2ttc19oZWxwZXIK
WyAgNTc5LjgxMTkxNF0gIGNyY3QxMGRpZl9wY2xtdWwKWyAgNTc5LjgxNTY2OV0gIGNlYwpbICA1
NzkuODE4ODEzXSAgY3JjdDEwZGlmX2NvbW1vbiBjcmMzMmNfaW50ZWwKWyAgNTc5LjgyMjEzNF0g
IHJjX2NvcmUgZHJtClsgIDU3OS44MjQzMjZdICBpMmNfYWxnb19iaXQgW2xhc3QgdW5sb2FkZWQ6
IGphaWxob3VzZV0KWyAgNTc5LjgyODc4MV0gIG1lZ2FyYWlkX3NhcyBzY3NpX21vZApbICA1Nzku
ODMxNjgwXQpbICA1NzkuODMxNjg0XSBDUFU6IDUwIFBJRDogMzQyMyBDb21tOiBkb2NrZXJkIFRh
aW50ZWQ6IEcgICAgICAgICAgIE8gTCAgICA1LjEwLjAgIzMKWyAgNTc5LjgzNzAxM10gIGNyY3Qx
MGRpZl9wY2xtdWwKWyAgNTc5Ljg0MDc5MF0gSGFyZHdhcmUgbmFtZTogRGVsbCBJbmMuIFBvd2Vy
RWRnZSBSNzQyNS8wOFYwMDEsIEJJT1MgMS4xNS4wIDA5LzExLzIwMjAKWyAgNTc5Ljg0MjY1NV0g
IGNyY3QxMGRpZl9jb21tb24gY3JjMzJjX2ludGVsClsgIDU3OS44NTA1NDddIFJJUDogMDAxMDpz
bXBfY2FsbF9mdW5jdGlvbl9tYW55X2NvbmQrMHgyOGUvMHgyZDAKWyAgNTc5Ljg1MzkxM10gIGky
Y19hbGdvX2JpdCBbbGFzdCB1bmxvYWRlZDogamFpbGhvdXNlXQpbICA1NzkuODYyMDA2XSBDb2Rl
OiAzYiAwNSAwYSBjMSA3NCAwMSA4OSBjNyAwZiA4MyAwYiBmZSBmZiBmZiA0OCA2MyBjNyA0OSA4
YiAxNiA0OCAwMyAxNCBjNSAwMCBkOSA5OSA5YyA4YiA0MiAwOCBhOCAwMSA3NCAwOSBmMyA5MCA4
YiA0MiAwOCBhOCAwMSA8NzU+IGY3IGViIGM5IDQ4IGM3IGMyIDIwIGNmIDA3IDlkIDRjIDg5IGZl
IDQ0IDg5IGY3IGU4IGFjIDhhIDAKWyAgNTc5Ljg2NjU0MF0KWyAgNTc5Ljg2NjU0NF0gQ1BVOiA1
OCBQSUQ6IDM0MzAgQ29tbTogZG9ja2VyZCBUYWludGVkOiBHICAgICAgICAgICBPIEwgICAgNS4x
MC4wICMzClsgIDU3OS44NzI3MzldIFJTUDogMDAwMDpmZmZmYTdkN2EyNDBiY2UwIEVGTEFHUzog
MDAwMDAyMDIKWyAgNTc5Ljg3ODE2NF0gSGFyZHdhcmUgbmFtZTogRGVsbCBJbmMuIFBvd2VyRWRn
ZSBSNzQyNS8wOFYwMDEsIEJJT1MgMS4xNS4wIDA5LzExLzIwMjAKWyAgNTc5Ljg5Nzg5MF0gUkFY
OiAwMDAwMDAwMDAwMDAwMDExIFJCWDogMDAwMDAwMDAwMDAzNDA2MCBSQ1g6IDAwMDAwMDAwMDAw
MDAwMDkKWyAgNTc5Ljg5Nzg5M10gUkRYOiBmZmZmOTY0ZjFmYTc0MDYwIFJTSTogMDAwMDAwMDAw
MDAwMDAwMCBSREk6IDAwMDAwMDAwMDAwMDAwMDkKWyAgNTc5Ljg5OTk0MV0gUklQOiAwMDEwOnNt
cF9jYWxsX2Z1bmN0aW9uX21hbnlfY29uZCsweDI4OS8weDJkMApbICA1NzkuOTA3OTY0XSBSQlA6
IGZmZmZmZmZmOWI4NzQ3YTAgUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIwOTogMDAwMDAwMDAwMDAw
MDAwOQpbICA1NzkuOTA3OTY4XSBSMTA6IDAwMDAwMDAwMDAwMDAwMDIgUjExOiAwMDAwMDAwMDAw
MDAwMDAyIFIxMjogZmZmZjk2MzcxZmJhYjNjMApbICA1NzkuOTEzNzU3XSBDb2RlOiBlOCAxYyA4
YSAzOSAwMCAzYiAwNSAwYSBjMSA3NCAwMSA4OSBjNyAwZiA4MyAwYiBmZSBmZiBmZiA0OCA2MyBj
NyA0OSA4YiAxNiA0OCAwMyAxNCBjNSAwMCBkOSA5OSA5YyA4YiA0MiAwOCBhOCAwMSA3NCAwOSBm
MyA5MCA8OGI+IDQyIDA4IGE4IDAxIDc1IGY3IGViIGM5IDQ4IGM3IGMyIDIwIGNmIDA3IDlkIDRj
IDg5IGZlIDQ0IDcKWyAgNTc5LjkyMTk5OF0gUjEzOiAwMDAwMDAwMDAwMDAwMDdlIFIxNDogZmZm
Zjk2MzcxZmJhYzljMCBSMTU6IDAwMDAwMDAwMDAwMDAwODAKWyAgNTc5LjkyMjAwMV0gRlM6ICAw
MDAwN2ZiZDkyN2ZjNzAwKDAwMDApIEdTOmZmZmY5NjM3MWZiODAwMDAoMDAwMCkga25sR1M6MDAw
MDAwMDAwMDAwMDAwMApbICA1NzkuOTI5NzI0XSBSU1A6IDAwMDA6ZmZmZmE3ZDc4ZjZkYmNlMCBF
RkxBR1M6IDAwMDAwMjAyClsgIDU3OS45Mzc0NThdIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAw
MCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKWyAgNTc5LjkzNzQ2MV0gQ1IyOiAwMDAwMDBjMDAxYTNh
MDEwIENSMzogMDAwMDAwMTA5ODdlYTAwMCBDUjQ6IDAwMDAwMDAwMDAzNTA2ZTAKWyAgNTc5Ljk0
MzgxOF0gUkFYOiAwMDAwMDAwMDAwMDAwMDExIFJCWDogMDAwMDAwMDAwMDAzNDE2MCBSQ1g6IDAw
MDAwMDAwMDAwMDAwMDkKWyAgNTc5Ljk0MzgyMV0gUkRYOiBmZmZmOTY0ZjFmYTc0MTYwIFJTSTog
MDAwMDAwMDAwMDAwMDAwMCBSREk6IDAwMDAwMDAwMDAwMDAwMDkKWyAgNTc5Ljk1MTU4MV0gQ2Fs
bCBUcmFjZToKWyAgNTc5Ljk1OTM0NF0gUkJQOiBmZmZmZmZmZjliODc0N2EwIFIwODogMDAwMDAw
MDAwMDAwMDAwMCBSMDk6IDAwMDAwMDAwMDAwMDAwMDkKWyAgNTc5Ljk1OTM0OF0gUjEwOiAwMDAw
MDAwMDAwMDAwMDAyIFIxMTogMDAwMDAwMDAwMDAwMDAwMiBSMTI6IGZmZmY5NjM3MWZiZWIzYzAK
WyAgNTc5Ljk3OTM5Nl0gID8gZmx1c2hfdGxiX2Z1bmNfY29tbW9uLmNvbnN0cHJvcC4wKzB4MWUw
LzB4MWUwClsgIDU3OS45ODcyMzldIFIxMzogMDAwMDAwMDAwMDAwMDA3ZSBSMTQ6IGZmZmY5NjM3
MWZiZWM5YzAgUjE1OiAwMDAwMDAwMDAwMDAwMDgwClsgIDU3OS45ODcyNDNdIEZTOiAgMDAwMDdm
YmQ3MmZmZDcwMCgwMDAwKSBHUzpmZmZmOTYzNzFmYmMwMDAwKDAwMDApIGtubEdTOjAwMDAwMDAw
MDAwMDAwMDAKWyAgNTc5Ljk5NjA2M10gID8gZmx1c2hfdGxiX2Z1bmNfY29tbW9uLmNvbnN0cHJv
cC4wKzB4MWUwLzB4MWUwClsgIDU4MC4wMDIwMzVdIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAw
MCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKWyAgNTgwLjAwMjAzOF0gQ1IyOiAwMDAwMDBjMDAxZDky
MDEwIENSMzogMDAwMDAwMTA5ODdlYTAwMCBDUjQ6IDAwMDAwMDAwMDAzNTA2ZTAKWyAgNTgwLjAw
ODUzNV0gID8geDg2X2NvbmZpZ3VyZV9ueCsweDQwLzB4NDAKWyAgNTgwLjAwODUzOF0gIG9uX2Vh
Y2hfY3B1X2NvbmRfbWFzaysweDJmLzB4ODAKWyAgNTgwLjAxNjQzN10gQ2FsbCBUcmFjZToKWyAg
NTgwLjAyNDM0Nl0gIGZsdXNoX3RsYl9tbV9yYW5nZSsweGJkLzB4ZjAKWyAgNTgwLjAzMjI2NF0g
ID8gZmx1c2hfdGxiX2Z1bmNfY29tbW9uLmNvbnN0cHJvcC4wKzB4MWUwLzB4MWUwClsgIDU4MC4w
MzU1MTBdICBwdGVwX2NsZWFyX2ZsdXNoKzB4NTUvMHg2MApbICA1ODAuMDQzNDU3XSAgPyBmbHVz
aF90bGJfZnVuY19jb21tb24uY29uc3Rwcm9wLjArMHgxZTAvMHgxZTAKWyAgNTgwLjA1MTQxM10g
IHdwX3BhZ2VfY29weSsweDJlNy8weDg2MApbICA1ODAuMDU3OTEwXSAgPyB4ODZfY29uZmlndXJl
X254KzB4NDAvMHg0MApbICA1ODAuMDU3OTE0XSAgb25fZWFjaF9jcHVfY29uZF9tYXNrKzB4MmYv
MHg4MApbICA1ODAuMDY1ODk1XSAgaGFuZGxlX21tX2ZhdWx0KzB4MTFlYy8weDFjMzAKWyAgNTgw
LjA3NDg0N10gIGZsdXNoX3RsYl9tbV9yYW5nZSsweGJkLzB4ZjAKWyAgNTgwLjA4MTM5MF0gIGRv
X3VzZXJfYWRkcl9mYXVsdCsweDFiOC8weDNmMApbICA1ODAuMDg4MDQwXSAgcHRlcF9jbGVhcl9m
bHVzaCsweDU1LzB4NjAKWyAgNTgwLjA5NjA4NV0gIGV4Y19wYWdlX2ZhdWx0KzB4NzgvMHgxNjAK
WyAgNTgwLjEwMTAxMF0gIHdwX3BhZ2VfY29weSsweDJlNy8weDg2MApbICA1ODAuMTA2MjExXSAg
PyBhc21fZXhjX3BhZ2VfZmF1bHQrMHg4LzB4MzAKWyAgNTgwLjEwOTU4MV0gIGhhbmRsZV9tbV9m
YXVsdCsweDExZWMvMHgxYzMwClsgIDU4MC4xMTQ1MTVdICBhc21fZXhjX3BhZ2VfZmF1bHQrMHgx
ZS8weDMwClsgIDU4MC4xMjExMDddICBkb191c2VyX2FkZHJfZmF1bHQrMHgxYjgvMHgzZjAKWyAg
NTgwLjEyNTg4Nl0gUklQOiAwMDMzOjB4NTYyYjM1ZWIyYzdmClsgIDU4MC4xMzI0OTBdICBleGNf
cGFnZV9mYXVsdCsweDc4LzB4MTYwClsgIDU4MC4xMzcxMDBdIENvZGU6IGZhIDAwIDgwIDAwIDAw
IDc3IGUxIDQ4IDg5IDRjIDI0IDE4IDQ4IDg5IDU0IDI0IDMwIDQ4IDg5IDQ0IDI0IDI4IDQ4IDhi
IDU0IDI0IDEwIDQ4IDhiIDVhIDE4IDQ4IDhkIDA0IDBiIDQ4IDg5IDQ0IDI0IDM4IDg0IDAyIDw0
OD4gYzcgNDAgMTAgMDAgMDAgMDAgMDAgZTggNTQgNTYgZmUgZmYgNDggOGIgNGMgMjQgMTggNDgg
ODUgNQpbICA1ODAuMTQyMDYzXSAgPyBhc21fZXhjX3BhZ2VfZmF1bHQrMHg4LzB4MzAKWyAgNTgw
LjE0NzI2NV0gUlNQOiAwMDJiOjAwMDA3ZmJkOTI3ZmJiZDggRUZMQUdTOiAwMDAxMDI0NgpbICA1
ODAuMTUyMjk2XSAgYXNtX2V4Y19wYWdlX2ZhdWx0KzB4MWUvMHgzMApbICA1ODAuMTU3MjM1XSBS
QVg6IDAwMDAwMGMwMDFhM2EwMDAgUkJYOiAwMDAwMDBjMDAxYTNhMDAwIFJDWDogMDAwMDAwMDAw
MDAwMDAwMApbICA1ODAuMTU3MjM4XSBSRFg6IDAwMDA3ZmJlYjQ3YmJjMjAgUlNJOiAwMDAwMDAw
MDAwMDAwMDgxIFJESTogMDAwMDU2MmIzOTEzYTIzMApbICA1ODAuMTYyMzQ2XSBSSVA6IDAwMzM6
MHg1NjJiMzVlYjJjN2YKWyAgNTgwLjE2NzA5Nl0gUkJQOiAwMDAwN2ZiZDkyN2ZiYzI4IFIwODog
MDAwMDAwMDAwMDAwMDAwMCBSMDk6IDAwMDAwMDAwMDAwMDAwMDAKWyAgNTgwLjE2NzA5OV0gUjEw
OiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDIwNiBSMTI6IDAwMDAwMDAwMDAw
MDAwMDQKWyAgNTgwLjE3MTc1M10gQ29kZTogZmEgMDAgODAgMDAgMDAgNzcgZTEgNDggODkgNGMg
MjQgMTggNDggODkgNTQgMjQgMzAgNDggODkgNDQgMjQgMjggNDggOGIgNTQgMjQgMTAgNDggOGIg
NWEgMTggNDggOGQgMDQgMGIgNDggODkgNDQgMjQgMzggODQgMDIgPDQ4PiBjNyA0MCAxMCAwMCAw
MCAwMCAwMCBlOCA1NCA1NiBmZSBmZiA0OCA4YiA0YyAyNCAxOCA0OCA4NSA1ClsgIDU4MC4xNzYy
OThdIFIxMzogMDAwMDAwMDAwMDAwMDBjNCBSMTQ6IDAwMDAwMGMwMDBmNmM0ZTAgUjE1OiAwMDAw
NTYyYjM5MGMwMDAwClsgIDU4MC4zMDI3NThdIFJTUDogMDAyYjowMDAwN2ZiZDcyZmZjYmQ4IEVG
TEFHUzogMDAwMTAyNDYKWyAgNTgwLjMwODYyNV0gUkFYOiAwMDAwMDBjMDAxZDkyMDAwIFJCWDog
MDAwMDAwYzAwMWQ5MjAwMCBSQ1g6IDAwMDAwMDAwMDAwMDAwMDAKWyAgNTgwLjMxNjQxMF0gUkRY
OiAwMDAwN2ZiZWI0NWZjNmMwIFJTSTogMDAwMDAwMDAwMDAwMDAwNCBSREk6IDAwMDAwMDAwMDAw
MDAwMDEKWyAgNTgwLjMyNDE4OV0gUkJQOiAwMDAwN2ZiZDcyZmZjYzI4IFIwODogMDAwMDAwMDAw
MDAwMDAwNCBSMDk6IDAwMDAwMGMwMDFkOTIwMDAKWyAgNTgwLjMzMTk1N10gUjEwOiAwMDAwMDAw
MDAwMDAwZWNjIFIxMTogMDAwMDAwMDAwMDAwMDAwMyBSMTI6IDAwMDAwMDAwMDAwMDAwMDQKWyAg
NTgwLjMzOTcyNV0gUjEzOiAwMDAwMDAwMDAwMDAwMDc1IFIxNDogMDAwMDAwYzAwMTA4ODgyMCBS
MTU6IDAwMDAwMDAwMDA4MDIwMDAKWyAgNTgxLjg2Mzc2N10gcmN1OiBJTkZPOiByY3Vfc2NoZWQg
ZGV0ZWN0ZWQgc3RhbGxzIG9uIENQVXMvdGFza3M6ClsgIDU4NS4wNjUzNjJdIFNlbmRpbmcgTk1J
IGZyb20gQ1BVIDAgdG8gQ1BVcyA3OgpbICA1OTQuOTk2NTAzXSByY3U6IHJjdV9zY2hlZCBrdGhy
ZWFkIHN0YXJ2ZWQgZm9yIDE3Mzc3IGppZmZpZXMhIGc0ODUzNyBmMHgyIFJDVV9HUF9ET0lOR19G
UVMoNikgLT5zdGF0ZT0weDAgLT5jcHU9MTQKWyAgNTk0Ljk5NjUwN10gcmN1OiAgICAgMS0uLi4w
OiAoODM5IEdQcyBiZWhpbmQpIGlkbGU9YzJhLzEvMHg0MDAwMDAwMDAwMDAwMDAwIHNvZnRpcnE9
NjgxLzY4MSBmcXM9MTgzNApbICA1OTQuOTk2NTE0XSByY3U6ICAgICAyLS4uLjA6ICgxNDQgR1Bz
IGJlaGluZCkgaWRsZT04MTIvMS8weDQwMDAwMDAwMDAwMDAwMDAgc29mdGlycT05MDUvOTA1IGZx
cz0xODM0ClsgIDU5NS4wMDc2NTVdIHJjdTogICAgIFVubGVzcyByY3Vfc2NoZWQga3RocmVhZCBn
ZXRzIHN1ZmZpY2llbnQgQ1BVIHRpbWUsIE9PTSBpcyBub3cgZXhwZWN0ZWQgYmVoYXZpb3IuClsg
IDU5NS4wMDc2NTldIHJjdTogUkNVIGdyYWNlLXBlcmlvZCBrdGhyZWFkIHN0YWNrIGR1bXA6Clsg
IDU5NS4wMTc4MDldIHJjdTogICAgIDMtLi4uMDogKDE0NCBHUHMgYmVoaW5kKSBpZGxlPWVhYS8x
LzB4NDAwMDAwMDAwMDAwMDAwMCBzb2Z0aXJxPTcxOS83MTkgZnFzPTE4MzUKWyAgNTk1LjAxNzgx
NV0gcmN1OiAgICAgNC0uLi4wOiAoMSBHUHMgYmVoaW5kKSBpZGxlPWMyZS8xLzB4NDAwMDAwMDAw
MDAwMDAwMCBzb2Z0aXJxPTEzMjQvMTMyNCBmcXM9MTgzNQpbICA1OTUuMDI3OTE3XSB0YXNrOnJj
dV9zY2hlZCAgICAgICBzdGF0ZTpSClsgIDU5NS4wMzgwNzNdIHJjdTogICAgIDUtLi4uMDogKDE0
NCBHUHMgYmVoaW5kKSBpZGxlPTQxYS8xLzB4NDAwMDAwMDAwMDAwMDAwMCBzb2Z0aXJxPTU1Ni81
NTYgZnFzPTE4MzUKWyAgNTk1LjAzODA3N10gcmN1OiAgICAgNi0uLi4wOiAoMTQ0IEdQcyBiZWhp
bmQpIGlkbGU9OTEyLzEvMHg0MDAwMDAwMDAwMDAwMDAwIHNvZnRpcnE9Nzc3Lzc3NyBmcXM9MTgz
NQpbICA1OTUuMDQ0Mjk1XSAgIHJ1bm5pbmcgdGFzayAgICAgc3RhY2s6ICAgIDAgcGlkOiAgIDEy
IHBwaWQ6ICAgICAyIGZsYWdzOjB4MDAwMDQwMDAKWyAgNTk1LjA1NDQ3M10gcmN1OiAgICAgNy0u
Li4wOiAoMTQ0IEdQcyBiZWhpbmQpIGlkbGU9NWU2LzEvMHg0MDAwMDAwMDAwMDAwMDAwIHNvZnRp
cnE9MjQwOS8yNDEwIGZxcz0xODM1ClsgIDU5NS4wNjQ2MTVdIENhbGwgVHJhY2U6ClsgIDU5NS4w
NjQ2MjJdICA/IGxvY2tfdGltZXJfYmFzZSsweDYxLzB4ODAKWyAgNTk1LjA2OTgyMF0gIChkZXRl
Y3RlZCBieSA4NywgdD00MDA3MiBqaWZmaWVzLCBnPTQ4NTM3LCBxPTI5MzMpClsgIDU5NS4wNzk5
NzhdICA/IHNjaGVkdWxlKzB4NDYvMHhiMApbICA1OTUuMDkwMTgwXSBTZW5kaW5nIE5NSSBmcm9t
IENQVSA4NyB0byBDUFVzIDE6ClsgIDU5NS4wOTg4OTRdICA/IF9yYXdfc3Bpbl9sb2NrX2lycXNh
dmUrMHgzMi8weDQwClsgIDU5NS4wOTg4OTldICA/IGZvcmNlX3FzX3JucCsweDZjLzB4MTkwClsg
IDU5NS4xNDM5MjJdICA/IGtmcmVlX3JjdV9zaHJpbmtfY291bnQrMHg1MC8weDUwClsgIDU5NS4x
NDkyMzldICA/IHJjdV9ncF9rdGhyZWFkKzB4NTljLzB4YTcwClsgIDU5NS4xNTQwMDddICA/IHJj
dV9jcHVfa3RocmVhZCsweDE5MC8weDE5MApbICA1OTUuMTU4ODQ1XSAgPyBrdGhyZWFkKzB4MTFi
LzB4MTQwClsgIDU5NS4xNjI5OTFdICA/IF9fa3RocmVhZF9iaW5kX21hc2srMHg2MC8weDYwClsg
IDU5NS4xNjgwMDhdICA/IHJldF9mcm9tX2ZvcmsrMHgyMi8weDMwClsgIDYwNS4wMjAzODldIFNl
bmRpbmcgTk1JIGZyb20gQ1BVIDg3IHRvIENQVXMgMjoKWyAgNjE0LjkzNzI1MV0gU2VuZGluZyBO
TUkgZnJvbSBDUFUgODcgdG8gQ1BVcyAzOgpbICA2MTkuMTgzMjAzXSB3YXRjaGRvZzogQlVHOiBz
b2Z0IGxvY2t1cCAtIENQVSMwIHN0dWNrIGZvciAyMnMhIFtrd29ya2VyLzA6MTo3XQpbICA2MTku
MTkxNjI0XSBNb2R1bGVzIGxpbmtlZCBpbjogamFpbGhvdXNlKE8pIG5mX2Nvbm50cmFja19uZXRs
aW5rIHhmcm1fdXNlciB4dF9hZGRydHlwZSBicl9uZXRmaWx0ZXIgeHRfQ0hFQ0tTVU0geHRfTUFT
UVVFUkFERSB4dF9jb25udHJhY2sgaXB0X1JFSkVDVCBuZl9yZWplY3RfaXB2NCB4dF90Y3B1ZHAg
bmZ0X2NvbXBhdCBuZnRfY2hhaW5fbmF0IG5mX25hdHAKWyAgNjE5LjE5MTY4M10gIGJpbmZtdF9t
aXNjIGNvbmZpZ2ZzIGVmaXZhcmZzIGlwX3RhYmxlcyB4X3RhYmxlcyBhdXRvZnM0IGV4dDQgY3Jj
MTYgbWJjYWNoZSBqYmQyIHJhaWQxMCByYWlkNDU2IGxpYmNyYzMyYyBjcmMzMmNfZ2VuZXJpYyBh
c3luY19yYWlkNl9yZWNvdiBhc3luY19tZW1jcHkgYXN5bmNfcHEgYXN5bmNfeG9yIHhvciBhc3lu
Y190eCByYWlkNl9wcSBdClsgIDYxOS4zMjcyOTZdIENQVTogMCBQSUQ6IDcgQ29tbToga3dvcmtl
ci8wOjEgVGFpbnRlZDogRyAgICAgICAgICAgTyBMICAgIDUuMTAuMCAjMwpbICA2MTkuMzM1NjM5
XSBIYXJkd2FyZSBuYW1lOiBEZWxsIEluYy4gUG93ZXJFZGdlIFI3NDI1LzA4VjAwMSwgQklPUyAx
LjE1LjAgMDkvMTEvMjAyMApbICA2MTkuMzQ0MTQ3XSBXb3JrcXVldWU6IGV2ZW50cyBkcm1fZmJf
aGVscGVyX2RpcnR5X3dvcmsgW2RybV9rbXNfaGVscGVyXQpbICA2MTkuMzUxNjE5XSBSSVA6IDAw
MTA6c21wX2NhbGxfZnVuY3Rpb25fbWFueV9jb25kKzB4Mjg5LzB4MmQwClsgIDYxOS4zNTgyMjZd
IENvZGU6IGU4IDFjIDhhIDM5IDAwIDNiIDA1IDBhIGMxIDc0IDAxIDg5IGM3IDBmIDgzIDBiIGZl
IGZmIGZmIDQ4IDYzIGM3IDQ5IDhiIDE2IDQ4IDAzIDE0IGM1IDAwIGQ5IDk5IDljIDhiIDQyIDA4
IGE4IDAxIDc0IDA5IGYzIDkwIDw4Yj4gNDIgMDggYTggMDEgNzUgZjcgZWIgYzkgNDggYzcgYzIg
MjAgY2YgMDcgOWQgNGMgODkgZmUgNDQgNwpbICA2MTkuMzc4NzQ3XSBSU1A6IDAwMTg6ZmZmZmE3
ZDc4MDE1ZmNkOCBFRkxBR1M6IDAwMDAwMjAyClsgIDYxOS4zODQ4NjBdIFJBWDogMDAwMDAwMDAw
MDAwMDAxMSBSQlg6IDAwMDAwMDAwMDAwMzEyODAgUkNYOiAwMDAwMDAwMDAwMDAwMDAxClsgIDYx
OS4zOTI4NzJdIFJEWDogZmZmZjk2NGYxZmEzMTI4MCBSU0k6IDAwMDAwMDAwMDAwMDAwMDAgUkRJ
OiAwMDAwMDAwMDAwMDAwMDAxClsgIDYxOS40MDA4NzNdIFJCUDogMDAwMDAwMDAwMDAwMDAwMCBS
MDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5OiAwMDAwMDAwMDAwMDAwMDAxClsgIDYxOS40MDg4Nzdd
IFIxMDogMDAwMDAwMDAwMDAwMDAwMiBSMTE6IDAwMDAwMDAwMDAwMDAwMDIgUjEyOiAwMDAwMDAw
MDAwMDAwMDAwClsgIDYxOS40MTY4NjZdIFIxMzogMDAwMDAwMDAwMDAwMDA3ZiBSMTQ6IGZmZmY5
NjJmMWY0MmM5YzAgUjE1OiAwMDAwMDAwMDAwMDAwMDgwClsgIDYxOS40MjQ4MzddIEZTOiAgMDAw
MDAwMDAwMDAwMDAwMCgwMDAwKSBHUzpmZmZmOTYyZjFmNDAwMDAwKDAwMDApIGtubEdTOjAwMDAw
MDAwMDAwMDAwMDAKWyAgNjE5LjQzMzc1NV0gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENS
MDogMDAwMDAwMDA4MDA1MDAzMwpbICA2MTkuNDQwMzM3XSBDUjI6IDAwMDAwMDAwMDAwMDAwMDAg
Q1IzOiAwMDAwMDAxMDk4N2VhMDAwIENSNDogMDAwMDAwMDAwMDM1MDZmMApbICA2MTkuNDQ4MzA2
XSBDYWxsIFRyYWNlOgpbICA2MTkuNDUxNTc0XSAgPyB0bGJmbHVzaF9yZWFkX2ZpbGUrMHg3MC8w
eDcwClsgIDYxOS40NTY1ODJdICA/IHRsYmZsdXNoX3JlYWRfZmlsZSsweDcwLzB4NzAKWyAgNjE5
LjQ2MTU2M10gIG9uX2VhY2hfY3B1KzB4MmIvMHg2MApbICA2MTkuNDY1NzU2XSAgX19wdXJnZV92
bWFwX2FyZWFfbGF6eSsweDVkLzB4NjgwClsgIDYxOS40NzA5NjhdICA/IF9jb25kX3Jlc2NoZWQr
MHgxNi8weDQwClsgIDYxOS40NzU0OTZdICA/IHVubWFwX2tlcm5lbF9yYW5nZV9ub2ZsdXNoKzB4
MmZhLzB4MzgwClsgIDYxOS40ODEzMjNdICBmcmVlX3ZtYXBfYXJlYV9ub2ZsdXNoKzB4ZTcvMHgx
MDAKWyAgNjE5LjQ4NjU0NV0gIHJlbW92ZV92bV9hcmVhKzB4OTYvMHhhMApbICA2MTkuNDkwOTc4
XSAgX192dW5tYXArMHg4ZC8weDI5MApbICA2MTkuNDk0OTg2XSAgZHJtX2dlbV9zaG1lbV92dW5t
YXArMHg4Yi8weGEwIFtkcm1dClsgIDYxOS41MDA0NzFdICBkcm1fY2xpZW50X2J1ZmZlcl92dW5t
YXArMHgxNi8weDIwIFtkcm1dClsgIDYxOS41MDYyOTddICBkcm1fZmJfaGVscGVyX2RpcnR5X3dv
cmsrMHgxODcvMHgxYjAgW2RybV9rbXNfaGVscGVyXQpbICA2MTkuNTEzMjUwXSAgcHJvY2Vzc19v
bmVfd29yaysweDFiNi8weDM1MApbICA2MTkuNTE4MDMzXSAgd29ya2VyX3RocmVhZCsweDUzLzB4
M2UwClsgIDYxOS41MjI0NjhdICA/IHByb2Nlc3Nfb25lX3dvcmsrMHgzNTAvMHgzNTAKWyAgNjE5
LjUyNzQyN10gIGt0aHJlYWQrMHgxMWIvMHgxNDAKWyAgNjE5LjUzMTQzMF0gID8gX19rdGhyZWFk
X2JpbmRfbWFzaysweDYwLzB4NjAKWyAgNjE5LjUzNjQ3N10gIHJldF9mcm9tX2ZvcmsrMHgyMi8w
eDMwClsgIDYyNC44NTM2MTZdIFNlbmRpbmcgTk1JIGZyb20gQ1BVIDg3IHRvIENQVXMgNDoKWyAg
NjM0Ljc3MDQ0OV0gU2VuZGluZyBOTUkgZnJvbSBDUFUgODcgdG8gQ1BVcyA1OgpbICA2NDQuNjg2
ODkwXSBTZW5kaW5nIE5NSSBmcm9tIENQVSA4NyB0byBDUFVzIDY6ClsgIDY1NC42MDMyNjNdIFNl
bmRpbmcgTk1JIGZyb20gQ1BVIDg3IHRvIENQVXMgNzoKWyAgNjY0LjUxOTU5NV0gcmN1OiByY3Vf
c2NoZWQga3RocmVhZCBzdGFydmVkIGZvciA4Nzg4IGppZmZpZXMhIGc0ODUzNyBmMHgyIFJDVV9H
UF9ET0lOR19GUVMoNikgLT5zdGF0ZT0weDAgLT5jcHU9MTQKWyAgNjY0LjUzMTIyOF0gcmN1OiAg
ICAgVW5sZXNzIHJjdV9zY2hlZCBrdGhyZWFkIGdldHMgc3VmZmljaWVudCBDUFUgdGltZSwgT09N
IGlzIG5vdyBleHBlY3RlZCBiZWhhdmlvci4KWyAgNjY0LjU0MTQ0MV0gcmN1OiBSQ1UgZ3JhY2Ut
cGVyaW9kIGt0aHJlYWQgc3RhY2sgZHVtcDoKWyAgNjY0LjU0NzUzOV0gdGFzazpyY3Vfc2NoZWQg
ICAgICAgc3RhdGU6UiAgcnVubmluZyB0YXNrICAgICBzdGFjazogICAgMCBwaWQ6ICAgMTIgcHBp
ZDogICAgIDIgZmxhZ3M6MHgwMDAwNDAwOApbICA2NjQuNTU4NzA5XSBDYWxsIFRyYWNlOgpbICA2
NjQuNTYxODk2XSAgPyBhc21fc3lzdmVjX2FwaWNfdGltZXJfaW50ZXJydXB0KzB4MTIvMHgyMApb
ICA2NjQuNTY3OTE4XSAgPyBfcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUrMHgxMS8weDIwClsg
IDY2NC41NzM1NzZdICA/IGZvcmNlX3FzX3JucCsweDE3OC8weDE5MApbICA2NjQuNTc4MDY4XSAg
PyBrZnJlZV9yY3Vfc2hyaW5rX2NvdW50KzB4NTAvMHg1MApbICA2NjQuNTgzMjMzXSAgPyByY3Vf
Z3Bfa3RocmVhZCsweDU5Yy8weGE3MApbICA2NjQuNTg3ODc0XSAgPyByY3VfY3B1X2t0aHJlYWQr
MHgxOTAvMHgxOTAKWyAgNjY0LjU5MjU4Nl0gID8ga3RocmVhZCsweDExYi8weDE0MApbICA2NjQu
NTk2NTk3XSAgPyBfX2t0aHJlYWRfYmluZF9tYXNrKzB4NjAvMHg2MApbICA2NjQuNjAxNDY3XSAg
PyByZXRfZnJvbV9mb3JrKzB4MjIvMHgzMApbICA2NjQuNjA1ODAzXSByY3U6IElORk86IHJjdV9z
Y2hlZCBkZXRlY3RlZCBzdGFsbHMgb24gQ1BVcy90YXNrczoKWyAgNjY0LjYxMjI4N10gcmN1OiAg
ICAgMS0uLi4wOiAoODM5IEdQcyBiZWhpbmQpIGlkbGU9YzJhLzEvMHg0MDAwMDAwMDAwMDAwMDAw
IHNvZnRpcnE9NjgxLzY4MSBmcXM9MTgzOApbICA2NjQuNjIxODA4XSByY3U6ICAgICAyLS4uLjA6
ICgxNDQgR1BzIGJlaGluZCkgaWRsZT04MTIvMS8weDQwMDAwMDAwMDAwMDAwMDAgc29mdGlycT05
MDUvOTA1IGZxcz0xODM4ClsgIDY2NC42MzEzMjVdIHJjdTogICAgIDMtLi4uMDogKDE0NCBHUHMg
YmVoaW5kKSBpZGxlPWVhYS8xLzB4NDAwMDAwMDAwMDAwMDAwMCBzb2Z0aXJxPTcxOS83MTkgZnFz
PTE4MzgKWyAgNjY0LjY0MDgzNl0gcmN1OiAgICAgNC0uLi4wOiAoMSBHUHMgYmVoaW5kKSBpZGxl
PWMyZS8xLzB4NDAwMDAwMDAwMDAwMDAwMCBzb2Z0aXJxPTEzMjQvMTMyNCBmcXM9MTgzOApbICA2
NjQuNjUwMzQ3XSByY3U6ICAgICA1LS4uLjA6ICgxNDQgR1BzIGJlaGluZCkgaWRsZT00MWEvMS8w
eDQwMDAwMDAwMDAwMDAwMDAgc29mdGlycT01NTYvNTU2IGZxcz0xODM4ClsgIDY2NC42NTk4Njld
IHJjdTogICAgIDYtLi4uMDogKDE0NCBHUHMgYmVoaW5kKSBpZGxlPTkxMi8xLzB4NDAwMDAwMDAw
MDAwMDAwMCBzb2Z0aXJxPTc3Ny83NzcgZnFzPTE4MzgKWyAgNjY0LjY2OTM3M10gcmN1OiAgICAg
Ny0uLi4wOiAoMTQ0IEdQcyBiZWhpbmQpIGlkbGU9NWU2LzEvMHg0MDAwMDAwMDAwMDAwMDAwIHNv
ZnRpcnE9MjQwOS8yNDEwIGZxcz0xODM4ClsgIDY2NC42NzkwNzFdICAoZGV0ZWN0ZWQgYnkgODcs
IHQ9NTc0NTYgamlmZmllcywgZz00ODUzNywgcT0zMzU0KQpbICA2NjQuNjg1NTMzXSBTZW5kaW5n
IE5NSSBmcm9tIENQVSA4NyB0byBDUFVzIDE6ClsgIDY3NC42MDE1OTRdIFNlbmRpbmcgTk1JIGZy
b20gQ1BVIDg3IHRvIENQVXMgMjoKWyAgNjg0LjUxNzY0MV0gU2VuZGluZyBOTUkgZnJvbSBDUFUg
ODcgdG8gQ1BVcyAzOgpbICA2OTQuNDMzNjgzXSBTZW5kaW5nIE5NSSBmcm9tIENQVSA4NyB0byBD
UFVzIDQ6ClsgIDcwNC4zNDk3MjJdIFNlbmRpbmcgTk1JIGZyb20gQ1BVIDg3IHRvIENQVXMgNToK
WyAgNzE0LjI2NTc2M10gU2VuZGluZyBOTUkgZnJvbSBDUFUgODcgdG8gQ1BVcyA2OgpbICA3MjQu
MTgxNzc0XSBTZW5kaW5nIE5NSSBmcm9tIENQVSA4NyB0byBDUFVzIDc6ClsgIDczNC4wOTc3Nzdd
IHJjdTogcmN1X3NjaGVkIGt0aHJlYWQgc3RhcnZlZCBmb3IgMTczNzggamlmZmllcyEgZzQ4NTM3
IGYweDIgUkNVX0dQX0RPSU5HX0ZRUyg2KSAtPnN0YXRlPTB4MCAtPmNwdT0xNApbICA3MzQuMTA4
NjM3XSByY3U6ICAgICBVbmxlc3MgcmN1X3NjaGVkIGt0aHJlYWQgZ2V0cyBzdWZmaWNpZW50IENQ
VSB0aW1lLCBPT00gaXMgbm93IGV4cGVjdGVkIGJlaGF2aW9yLgpbICA3MzQuMTE4MTE1XSByY3U6
IFJDVSBncmFjZS1wZXJpb2Qga3RocmVhZCBzdGFjayBkdW1wOgpbICA3MzQuMTIzNzAzXSB0YXNr
OnJjdV9zY2hlZCAgICAgICBzdGF0ZTpSICBydW5uaW5nIHRhc2sgICAgIHN0YWNrOiAgICAwIHBp
ZDogICAxMiBwcGlkOiAgICAgMiBmbGFnczoweDAwMDA0MDA4ClsgIDczNC4xMzQxNjBdIENhbGwg
VHJhY2U6ClsgIDczNC4xMzcxNTldICA/IGFzbV9zeXN2ZWNfYXBpY190aW1lcl9pbnRlcnJ1cHQr
MHgxMi8weDIwClsgIDczNC4xNDMwMjhdICA/IF9yYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSsw
eDExLzB4MjAKWyAgNzM0LjE0ODU0Nl0gID8gZm9yY2VfcXNfcm5wKzB4MTc4LzB4MTkwClsgIDcz
NC4xNTI5MzNdICA/IGtmcmVlX3JjdV9zaHJpbmtfY291bnQrMHg1MC8weDUwClsgIDczNC4xNTgw
MTVdICA/IHJjdV9ncF9rdGhyZWFkKzB4NTljLzB4YTcwClsgIDczNC4xNjI1NzJdICA/IHJjdV9j
cHVfa3RocmVhZCsweDE5MC8weDE5MApbICA3MzQuMTY3MjE4XSAgPyBrdGhyZWFkKzB4MTFiLzB4
MTQwClsgIDczNC4xNzExNjZdICA/IF9fa3RocmVhZF9iaW5kX21hc2srMHg2MC8weDYwClsgIDcz
NC4xNzU5ODZdICA/IHJldF9mcm9tX2ZvcmsrMHgyMi8weDMwClsgIDczNC4xODAyOTRdIHJjdTog
SU5GTzogcmN1X3NjaGVkIGRldGVjdGVkIHN0YWxscyBvbiBDUFVzL3Rhc2tzOgpbICA3MzQuMTg2
Nzc1XSByY3U6ICAgICAxLS4uLjA6ICg4MzkgR1BzIGJlaGluZCkgaWRsZT1jMmEvMS8weDQwMDAw
MDAwMDAwMDAwMDAgc29mdGlycT02ODEvNjgxIGZxcz0xODM4ClsgIDczNC4xOTYzMTRdIHJjdTog
ICAgIDItLi4uMDogKDE0NCBHUHMgYmVoaW5kKSBpZGxlPTgxMi8xLzB4NDAwMDAwMDAwMDAwMDAw
MCBzb2Z0aXJxPTkwNS85MDUgZnFzPTE4MzgKWyAgNzM0LjIwNTg0N10gcmN1OiAgICAgMy0uLi4w
OiAoMTQ0IEdQcyBiZWhpbmQpIGlkbGU9ZWFhLzEvMHg0MDAwMDAwMDAwMDAwMDAwIHNvZnRpcnE9
NzE5LzcxOSBmcXM9MTgzOApbICA3MzQuMjE1MzYxXSByY3U6ICAgICA0LS4uLjA6ICgxIEdQcyBi
ZWhpbmQpIGlkbGU9YzJlLzEvMHg0MDAwMDAwMDAwMDAwMDAwIHNvZnRpcnE9MTMyNC8xMzI0IGZx
cz0xODM4ClsgIDczNC4yMjQ4NjhdIHJjdTogICAgIDUtLi4uMDogKDE0NCBHUHMgYmVoaW5kKSBp
ZGxlPTQxYS8xLzB4NDAwMDAwMDAwMDAwMDAwMCBzb2Z0aXJxPTU1Ni81NTYgZnFzPTE4MzgKWyAg
NzM0LjIzNDM2N10gcmN1OiAgICAgNi0uLi4wOiAoMTQ0IEdQcyBiZWhpbmQpIGlkbGU9OTEyLzEv
MHg0MDAwMDAwMDAwMDAwMDAwIHNvZnRpcnE9Nzc3Lzc3NyBmcXM9MTgzOApbICA3MzQuMjQzODUx
XSByY3U6ICAgICA3LS4uLjA6ICgxNDQgR1BzIGJlaGluZCkgaWRsZT01ZTYvMS8weDQwMDAwMDAw
MDAwMDAwMDAgc29mdGlycT0yNDA5LzI0MTAgZnFzPTE4MzgKWyAgNzM0LjI1MzUxNF0gIChkZXRl
Y3RlZCBieSA4NywgdD03NDg1MCBqaWZmaWVzLCBnPTQ4NTM3LCBxPTMzNTQpClsgIDczNC4yNTk5
NTFdIFNlbmRpbmcgTk1JIGZyb20gQ1BVIDg3IHRvIENQVXMgMToKWyAgNzQ0LjE3NTk4OF0gU2Vu
ZGluZyBOTUkgZnJvbSBDUFUgODcgdG8gQ1BVcyAyOgpbICA3NTQuMDkyMDIwXSBTZW5kaW5nIE5N
SSBmcm9tIENQVSA4NyB0byBDUFVzIDM6ClsgIDc2NC4wMDgwNDJdIFNlbmRpbmcgTk1JIGZyb20g
Q1BVIDg3IHRvIENQVXMgNDoKWyAgNzczLjkyNDA1OF0gU2VuZGluZyBOTUkgZnJvbSBDUFUgODcg
dG8gQ1BVcyA1OgpbICA3ODMuODQwMDgyXSBTZW5kaW5nIE5NSSBmcm9tIENQVSA4NyB0byBDUFVz
IDY6ClsgIDc5My43NTYwODZdIFNlbmRpbmcgTk1JIGZyb20gQ1BVIDg3IHRvIENQVXMgNzoKWyAg
ODAzLjY3MjA4N10gcmN1OiByY3Vfc2NoZWQga3RocmVhZCBzdGFydmVkIGZvciAzNDc3MiBqaWZm
aWVzISBnNDg1MzcgZjB4MiBSQ1VfR1BfRE9JTkdfRlFTKDYpIC0+c3RhdGU9MHgwIC0+Y3B1PTE0
ClsgIDgwMy42ODI5NDBdIHJjdTogICAgIFVubGVzcyByY3Vfc2NoZWQga3RocmVhZCBnZXRzIHN1
ZmZpY2llbnQgQ1BVIHRpbWUsIE9PTSBpcyBub3cgZXhwZWN0ZWQgYmVoYXZpb3IuClsgIDgwMy42
OTI0MDldIHJjdTogUkNVIGdyYWNlLXBlcmlvZCBrdGhyZWFkIHN0YWNrIGR1bXA6ClsgIDgwMy42
OTc5NzRdIHRhc2s6cmN1X3NjaGVkICAgICAgIHN0YXRlOlIgIHJ1bm5pbmcgdGFzayAgICAgc3Rh
Y2s6ICAgIDAgcGlkOiAgIDEyIHBwaWQ6ICAgICAyIGZsYWdzOjB4MDAwMDQwMDgKWyAgODAzLjcw
ODQxNl0gQ2FsbCBUcmFjZToKWyAgODAzLjcxMTQwNF0gID8gYXNtX3N5c3ZlY19hcGljX3RpbWVy
X2ludGVycnVwdCsweDEyLzB4MjAKWyAgODAzLjcxNzI1NF0gID8gX3Jhd19zcGluX3VubG9ja19p
cnFyZXN0b3JlKzB4MTEvMHgyMApbICA4MDMuNzIyNzUyXSAgPyBmb3JjZV9xc19ybnArMHgxNzgv
MHgxOTAKWyAgODAzLjcyNzEzMl0gID8ga2ZyZWVfcmN1X3Nocmlua19jb3VudCsweDUwLzB4NTAK
WyAgODAzLjczMjIwOF0gID8gcmN1X2dwX2t0aHJlYWQrMHg1OWMvMHhhNzAKWyAgODAzLjczNjc1
MV0gID8gcmN1X2NwdV9rdGhyZWFkKzB4MTkwLzB4MTkwClsgIDgwMy43NDEzNzFdICA/IGt0aHJl
YWQrMHgxMWIvMHgxNDAKWyAgODAzLjc0NTI5OV0gID8gX19rdGhyZWFkX2JpbmRfbWFzaysweDYw
LzB4NjAKWyAgODAzLjc1MDEwMl0gID8gcmV0X2Zyb21fZm9yaysweDIyLzB4MzAKWyAgODAzLjc1
NDM5MF0gaHJ0aW1lcjogaW50ZXJydXB0IHRvb2sgMjIxODg5OTgwMzYwIG5zCgo=

--_004_AM0PR05MB601899CAC211F4C81A9757DFA9029AM0PR05MB6018eurp_--
