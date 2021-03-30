Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBMPQROBQMGQEGY2WD5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6902434E515
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Mar 2021 12:06:42 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id g19sf5344244lfv.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Mar 2021 03:06:42 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1617098802; cv=pass;
        d=google.com; s=arc-20160816;
        b=GfRgLhS5u9qinceGzZJGUtfchdmtqiIaAiUX9qpB5A3qqnM7AeFE3OdXgORh1DyoHD
         SY4SaQyBS8S/NUiCjmKY5Tc2aneb6pn4XSxiU8Ie7OHStax2C1v+0ANB4ZtPYFqCeLDf
         lYrboJrZ+HnTywDvytQ3cFLlxgVpEhz9fsIPvcjD7XucQhlNpg+ZnsS7C1LBt8Mrpaee
         Lu8rd3J2UGteDaW1arpPgOHB1itzfU3fuqQvQn6vC4uQlzTn9ykwtyPbUaO6DfiB3nN5
         gg7Q8K+gUTQGfMMetpIe027MeTTmJ8I5Sm80VkZtsGXGc0QSO9tmG/1UrSA/627Qy4Rp
         2G3w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=v4fM4qQ6+jkQyXkxbbX5M3lb4sufsEXa5T6kKaiH2So=;
        b=L1d6D+ainjN3d2RfkufwMXx92SJv5BYmPdmNiYmJLMUka/G1Kg9XjdeaFGEXXF4h4t
         c/6+lD9Wi5n3aMMFFKQpMwSHL1UYjecw12M+6ODPWkjvKBFEgEZZKGuemVmpptpgRG78
         xxsosXjJiDLZJ6nNmlbz1Gk1VceZOGWXktL6Lw0B5Kf1Q/P09ExjYex1o4Hmmjd1dZjd
         eawfn2fucw8j6GeUvXpVcamaz7rP+6INH5D7it6cGDRcqlBxt+ZrNFtxQOCQqf1rQk/p
         BtcSWD420yXq1Ywajwe8DtnGUh3hVVsPyLJ0JVjuj+Y3AB8XKtwMleaFJNDhnlYwRrQn
         le0Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=SuxEEUkz;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.14.54 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=v4fM4qQ6+jkQyXkxbbX5M3lb4sufsEXa5T6kKaiH2So=;
        b=iF7IvhIgAQx20Omo/I8/Hj+C0EZhN7kFNTh8KjtVbaw52cVuwrmrwFN4WY0zync1UU
         2WSqCZ4x+wKvhXsqAH/0O9UzzABWoub+vQSONa/Cudz85PahzKEV4j8E340zQ5lhxPl+
         t6HbKFHTo5PHXTf8hRxXObZ29FGJ6jAt+HTiVSp7Yzd1KKjQ/wSWVjGUzuewYNG7ja1C
         PH3OYcYbEajes8lOQ2ETO92aLCtIpQ+z0fepWhQxrfHXypYSaFn1+9XfN9LPt5Mh163t
         1j3Ekj/8BH2BckNN0KHUPRZHOFBM55ZsWS5NyKZYcMN0DsUs7o/hnhLwtyrEMhkB3bQp
         2vrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=v4fM4qQ6+jkQyXkxbbX5M3lb4sufsEXa5T6kKaiH2So=;
        b=OHTKG1xH/9MDQ7fk/piYi8hq3L4pHUzhkJv4p5Lbh+T28BbZ6GMWzPWsYnnbhLKKBG
         B+wrLFQFGa1GTBcx2UOvhudVl/t5JQKdniPnzF1IOQl0tYfFh1bv1NW7IHy2qlGnM/xg
         tr1iGBov6qzhp7NLfHpkAxqI9A/lMgz/zK2/X1wl1xRfRE3Nct2JZkZUXHNhCP32TkxK
         vAFmCDk7oEVRZ3eZSrD5IvruzC9TGbBjt8oW7ZSi4iQ3/iaQof7LW+H0obIZhz2oT353
         lF3OiXABvsN2Cx3gxNDS214ORXhF8HPF1Y5XIcf4RARzeqEpH7BRVc9o/nIumRF+cEAf
         AG2w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530PJX0wewG1mzlh5hI2OZV6jIUaqdOSG3eM+Eih4QDk6l21zzgM
	u8wSAoPXyyzvjP8Pk9JC5Hg=
X-Google-Smtp-Source: ABdhPJyd8M2a7xqs3cp+RCYXCRFEc1AgrAsl1VvkGRB7rqmoznktzs7/N464Cc3DsaX4bWm1wYOu2Q==
X-Received: by 2002:a2e:87d5:: with SMTP id v21mr20083910ljj.195.1617098801815;
        Tue, 30 Mar 2021 03:06:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:e86:: with SMTP id 128ls4806247lfo.0.gmail; Tue, 30 Mar
 2021 03:06:40 -0700 (PDT)
X-Received: by 2002:ac2:484d:: with SMTP id 13mr18477634lfy.124.1617098800706;
        Tue, 30 Mar 2021 03:06:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1617098800; cv=pass;
        d=google.com; s=arc-20160816;
        b=X2RTXPYYgHlisWmBAo4scehGfK5aCxuK/LKkVGUi6aUHzP0Cde9jGytqfxkeZDNv5U
         9Wt82GTXaeZ+v+RWymkQaxTeDSdCRD3Z0Tr2H3n+BKFMetaXdiCNe8/xWbAiAbMFfXlv
         HIpzURrNsueP9mO+Ko5KZn9z8Kw9L29UTjHvcZQUL5oWY2oCKXkZ0IDoRT+3pkiC61Ox
         nW4IbQ92QU1hrDNYT7RDgs+14tgkDtgoOUMiQQ7ZYBHNr+QlYGocJVYbsT5oebt7gn4W
         RiPZnpwKkDi7AdmVsLlFI98+XUNvPWDUL3W8I345JsGgJqnBDy5JbGy7BJRpstGo1YH7
         l/5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=R95b7vswbj+JhMcYmCR6mucxA4Qf/9M7g6sGyYAbGp8=;
        b=yonH+QATRsFj1l5zG6uclrBBXdWqM6/Wc9P9/JaPb5GDcHxvTy9vIUa9UdhY8unZUu
         dcS7p9RKdKcN3imkoWaHBLJUXpCw6A3x08WBJPHotJ3UQ53fqfZY6Wz51rj2kFcnCmmt
         Jdvq2AgLapkuKdUh0Wg3aGX/sSHnb6V8UklNPY2QCte/OdgRttYMnFtc+1uLGEaALIwW
         sOjZbj90MJ07ja6eziV4LN6uRorAc46J8Ap8ocLuN7qyTJh+jyDn5WCTrErYQzP5A0ok
         7ckd7u/4hejjD8UyYHhmwJv4B/W5zrvuE8Zjr7eOISj5TuVAdrkRzopF/M/iIdTTxhbc
         dSMw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=SuxEEUkz;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.14.54 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140054.outbound.protection.outlook.com. [40.107.14.54])
        by gmr-mx.google.com with ESMTPS id v203si841947lfa.10.2021.03.30.03.06.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Mar 2021 03:06:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.14.54 as permitted sender) client-ip=40.107.14.54;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4qwqQNoqyPOv1CDdYze40iLmqa2LSsv/Mi4SvIr32OBjZfj+Qv7G6U+kHy/E0q3LSXI/ZH0e/xjd6OYhGCuSqdEf46s4t9owdz3B7L+KX3/359WW4tGUIA5JeaE8BKDoNj4QLqZ0iOFbN5WLyggjnIeNcQ2H+c1J/a+87aoHet+Jg9NbROce9ivTvfanuVpXARQ0H+m7JpdwUxEWxRM6nXfpfW9hK5r8Djrmyb20juVyFadHSniRfMeC8DIi6QoLTIuM8Lyk+KNPFjy8bF4VGeoZq3YjEaRdskZBw21IeiyoFuJs+TQyJIejCN+J2CiH3b+ZyvW22oJ+cmIskOGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R95b7vswbj+JhMcYmCR6mucxA4Qf/9M7g6sGyYAbGp8=;
 b=bj5btRNEEtQGRgi0m5fQjBg/+wLaUOgw6sLVOnOB/rx4Eb6kEvlrZLqhGw9Q71NfUtElIYTYx8BGryzmQjsGZN0KbrTSQwSb0TvV/M0KEbyZL+3jvtIz4qBy9B5RkyWgq3DyvJhGd8gKudrIdUHf7Y87UXQI0/5pyQyIOvEis1yoQsFTtbwqzST9O5IJfH4cOjQhiQT1ncZhC30eVdY642VEzS0L88i/WQLR5I78OVZk8mfIGrSlV45/gN81l0VFqif6x5uOA7C+CU3mS+eXsOVhAD139dwm9c0tkPxZtUNnE1KBU5XDiJXt2bO8BQrxaUaBUa3P/uF58Swt+T5omQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBAPR04MB7285.eurprd04.prod.outlook.com (2603:10a6:10:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.31; Tue, 30 Mar
 2021 10:06:39 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 10:06:39 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH 1/5] arm: gic-v3: inject irq priority to inmates
Thread-Topic: [PATCH 1/5] arm: gic-v3: inject irq priority to inmates
Thread-Index: AQHXH6j4jChJyTlnT0OlFGXM4PoZdKqRMeaAgAsnJmA=
Date: Tue, 30 Mar 2021 10:06:38 +0000
Message-ID: <DB6PR0402MB27602E8BF1734D621F17EEDC887D9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20210323062536.3888-1-peng.fan@nxp.com>
 <ff73ae1f-352d-52a0-c21e-fd7351a444ad@siemens.com>
In-Reply-To: <ff73ae1f-352d-52a0-c21e-fd7351a444ad@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b037db65-3bbf-4a94-04b2-08d8f3638293
x-ms-traffictypediagnostic: DBAPR04MB7285:
x-microsoft-antispam-prvs: <DBAPR04MB728575A36F495E2DD779F757887D9@DBAPR04MB7285.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yNTHy+NbHxT3hHp8f8la8UYAA1yV7DUhluCsJcHk09MWY7RLdcj6MGOnnyRBDeNUt7/vYM//InwNokSU+XNIg+f4edTl+axwwIbvBCgPWlAXQxXnWtkYRNLiujK5kyTcG+m9vArKbs4U/nXZtfj787Rd/0gD1H0XgGVrJcXWdQYgbeq2jFCRkA5g9UhxGTUcYe2jFNnQpeeSwYtagfVmzwlBxdxrx/tCmYDX556udytVaw4bVulqNAB+MviBuP3r6gqy6efPg0t2knr5gDAUTsoiinngFx2oMR/8AeQ3hzgQUkXoBOMqFZfLkpurctM+MA35wSbrzSfKX31NWmuqKo3gTlfeXGDEuXKi5YArs7pIf/kxrjeoenSrR01p2FdpORrc/KWk41tlLTHHVV4J1ewIVnkE45rpCgQ4yC4ctdYFQgCYDHOgVUDSo5Q+tSBTI8xzo+XkqsQGganQYP26UPT3KJqXC6eXki2x8V8wgKMt65wydlpn9D1VuexcCvjdaSyPRkm40mMC/vQeAvV/KCZy23ZL+zLmBvo7cztGUUtEBgqjlhPO/VE8e0MFMgUTK7BRFV7o8ANDsPsHcuapmecKD+BLeTYtRk+t6zljubcK7rU+4hEXrshBCtO35hnxO83DZtx+bYY/l9lPOz6ll1M1vj8jknDoC91N94JVkjh+eiKD+5oreyG/dzKyUdjEImDPw9VN3d/2jL3ahQQuG21vXbdVjXm1S+7QLnQxySg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(366004)(136003)(76116006)(26005)(66476007)(38100700001)(33656002)(71200400001)(2906002)(45080400002)(8936002)(316002)(5660300002)(9686003)(52536014)(86362001)(55016002)(966005)(110136005)(186003)(66446008)(478600001)(64756008)(8676002)(53546011)(6506007)(7696005)(83380400001)(66946007)(66556008)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?PHc7g3pxba0Awx3nObvs2REdZy0dJyXkSpRjpchCbT7r0yjUYn50R9dbV1XL?=
 =?us-ascii?Q?gU3a3NujyYnd54lQpx9/O3/tF74VYsWHggwrN0ejiJtGGNW49gNlwBvvdZuA?=
 =?us-ascii?Q?J+Fc12FW049pHRDQkeY1Dg7m4gZn8nl8zVlhin8/2EBJJzJwk05e/km75MET?=
 =?us-ascii?Q?pyfg8nyn0yQ2nFxV2oPSeEy9MnlzPDT0WqHWuA9/lR/z1gHaD856zkhDnRNw?=
 =?us-ascii?Q?Ny/ar4rkRfRvqwjimzenswA12BWjM8i213c4awtHtkxFXw7FEJWGQzVHrLvw?=
 =?us-ascii?Q?/S7NaoEha5u6YQsHDO+xAdKWIBYx1Cv/nuiysOH0ujlXTfxmiTK3bL/FTIzU?=
 =?us-ascii?Q?d1w3Ixybkiw+HTdIIJmEVr1G0ErmpmkOce81eZdTSn2ypp7TGj2OL+LyLkxG?=
 =?us-ascii?Q?LYU0Gt8x+xEE6xj8NTLp/9dDGJVfsmgyu3fmr1SbN9ICz8Wk0yCjzX43jqkt?=
 =?us-ascii?Q?E+Wm6Y+IlAt2yuzHFmYS078x8YBepvLyN6ac/3Dfg9viPSMh77fN2g3qQbQf?=
 =?us-ascii?Q?aM7EX4z36sEIhWz0iYYKQOfbxVcRZ3pgCLECgJV9m3V3/tXJR/PuB81Wr0Pq?=
 =?us-ascii?Q?NwfUSACDR/84mgIqeot+R4FwgGnU8qWLl+WtAdUKO7tNLg4vKDzvvvseiCLO?=
 =?us-ascii?Q?I63vNWE7G3E+0JMFLc+YSgbKhyR+QNWvO3/7XncIsvTbqV/IFw3NKKHjw9Bh?=
 =?us-ascii?Q?4XLOS0xyCtkHOwH4KyMZl1faW8/XyZx/D4m1igiM7ShrPbEGDtZnJuSI965I?=
 =?us-ascii?Q?3TY1jBfQBpdHPRoe0aKTne6Xuy0sdKltceuTmBJK74wnNqomlOMUCb6nQYub?=
 =?us-ascii?Q?GZSw9LbVJAOh6bz84cyxgQANUukHhAZc6qlo+3sfielPld+xBdMPNk+99LqZ?=
 =?us-ascii?Q?9FuYaAM+3NxDrl9/V56jcY6M3gmcfa0IBe0Gb0IZ+MIr9qzR0bi4yY5UeR8P?=
 =?us-ascii?Q?IFoTxz/k7GE18QkdWJ2a0I2N2miXOZstwGEgxzcLcqscrWnzW3k/fBcxqsZo?=
 =?us-ascii?Q?rY+lJW8h/WHEc9E0hqDl9xZusD7JZBMuxoA89RPobQSJQYRPxK0XEKVywdK6?=
 =?us-ascii?Q?SYzZ42lej8u0D88AEjw8ideKBQJRn+KxHsRwZ2YVE71rjYYA+If/K3Ik7P5h?=
 =?us-ascii?Q?WwX65+GUygUw4mHILYeVUmJ94+k7hIAmgEXm9r2N/aTWoPZyJgbX8cEVAV6e?=
 =?us-ascii?Q?ZvuwfZM73uQxr/Ss4WN3H1ElRkV4b2nHjL7mQ2mi/3eynwG18scaUN2SXxu3?=
 =?us-ascii?Q?5rlaWZO2Thhy7JmaCsm97HSfQTJ44jirsrTa9nYjTpzmoxl+XLKkOdMQkPgG?=
 =?us-ascii?Q?hW7Z975IPQWvY59PeuO9yLh6?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b037db65-3bbf-4a94-04b2-08d8f3638293
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2021 10:06:38.9900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ob3jeno+weK2vyv+4lFCI84p4JARxtcLL/5AZWALTPdDUD3uEA0qtb7MtVQymvmaQTAyZqh2bTokJb/p5TBzoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7285
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=SuxEEUkz;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.14.54 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

> Subject: Re: [PATCH 1/5] arm: gic-v3: inject irq priority to inmates
> 
> On 23.03.21 07:25, peng.fan@nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Inject physical IRQ priority to inmates.
> >
> 
> Reasoning is missing, use case description. Specifically as this approach has no
> influence on the ordering in the software queue. And as it's only targeting
> GICv2. And possibly there are more limitations.

Before this fix, any cell was receiving all interrupts at the highest level (priority=0),
so the inmate code was not able to mask sources or to enable priority-based ISR
preemption/nesting.

This version patch not take PPI into consideration, I may need to add that in v2.

Thanks,
Peng.

> 
> So far the decision was to ignore those rarely used IRQ prios because of the
> additional complexity to emulate them accurately.
> 
> See also
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.
> com%2Fsiemens%2Fjailhouse%2Fcommit%2F03475882880dc5ae49d0852c62
> 8a8b8958be80ac&amp;data=04%7C01%7Cpeng.fan%40nxp.com%7C399011
> 156dea40beabae08d8edcfbfb9%7C686ea1d3bc2b4c6fa92cd99c5c301635%7
> C0%7C0%7C637520823814036005%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C10
> 00&amp;sdata=KWf9Mblg3KywaIl04YRpuFTCE6S3fzRrJXnDC5gKZqc%3D&am
> p;reserved=0.
> 
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  hypervisor/arch/arm-common/gic-v3.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/hypervisor/arch/arm-common/gic-v3.c
> > b/hypervisor/arch/arm-common/gic-v3.c
> > index 4ebb2357..2293f844 100644
> > --- a/hypervisor/arch/arm-common/gic-v3.c
> > +++ b/hypervisor/arch/arm-common/gic-v3.c
> > @@ -533,9 +533,11 @@ static void gicv3_eoi_irq(u32 irq_id, bool
> > deactivate)
> >
> >  static int gicv3_inject_irq(u16 irq_id, u16 sender)  {
> > +	void *gicr = this_cpu_public()->gicr.base + GICR_SGI_BASE;
> >  	unsigned int n;
> >  	int free_lr = -1;
> >  	u32 elsr;
> > +	u32 iprio;
> >  	u64 lr;
> >
> >  	arm_read_sysreg(ICH_ELSR_EL2, elsr); @@ -572,6 +574,16 @@ static
> int
> > gicv3_inject_irq(u16 irq_id, u16 sender)
> >  	if (!is_sgi(irq_id)) {
> >  		lr |= ICH_LR_HW_BIT;
> >  		lr |= (u64)irq_id << ICH_LR_PHYS_ID_SHIFT;
> > +
> > +		if (is_spi(irq_id))
> > +			iprio = mmio_read32(gicd_base + GICD_IPRIORITYR +
> > +					    (irq_id & ~3));
> > +		else
> > +			iprio = mmio_read32(gicr + GICR_IPRIORITYR +
> > +					    (irq_id & ~3));
> > +
> > +		iprio = (iprio >> ((irq_id & 3) * 8)) & 0xff;
> > +		lr |= (u64)iprio << ICH_LR_PRIORITY_SHIFT;
> >  	}
> >  	/* GICv3 doesn't support the injection of the calling CPU ID */
> >
> >
> 
> Jan
> 
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB27602E8BF1734D621F17EEDC887D9%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
