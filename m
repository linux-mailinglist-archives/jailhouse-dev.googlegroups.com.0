Return-Path: <jailhouse-dev+bncBCWKP54GYYIRB5H2ZWOQMGQEGFWWE3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id D952165B876
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Jan 2023 01:57:25 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id o5-20020adfba05000000b0029064ccbe46sf853823wrg.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Jan 2023 16:57:25 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1672707445; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZOwFXoHpN7FocTBhs6YhTqYnwH4e0YsLbt4WrJPw2TZaRWK03saiP5fmdw3OgiNDxl
         nwNcZn1pCUTq4oaKxp4zAU0XhMpTR6iJHpU72P9on3UQgKVxowIiuSy/milIW7tPv72H
         8JYrYzLEoJHBogJfC9t/mNdL5XCy1QQuWtbLK51WwG82rEJ2r01TiKx9XgiahyLMD3Fp
         IxKBga1Wj/bull0HVsEvFFH7Wlbg1UQuE+z4ksAOlrNTAp8RE+rO6UDTej1RzFIY7POI
         UclPYOa97xf8o4Ua/10mfsWdxUOeE3vVUn5s/AcJLtcOS4y5NW8FLVsdLy6Xxb476nPn
         T4Yg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=WzLAc+J/m40dt2UeUPpKO6R5lHrwt2nBKCYPlZ0N4fY=;
        b=euTstEGXuKZxTbKd4qGjA/v7q5a/HblCY7dv65bL6c88gS80aAjBxlA7oVFkWfgaWV
         dc0PzXeVs8zn50OZEunU8+gAmF+bk5HvYHRMQku4r6LF2iFpOJdk6cOtgxoDmju2AqSo
         lsK8tTbvr7b1lRii7AGkonMg4PFAr/gZ6vcAF3wmmDQ32UcIb+mtPZn4FCVY+nUJourK
         J+03fQo8X26RHEX2J0s2k4PPADadz/OedH0KtuC962MS2gI/x9KRDXntQ8+eRfKe555B
         7id0neMrd9flniuWQMFosu32ttSnu0YK6YnfT7Q1zYIxPU/pyboaszlRlpiRyaTipaK2
         d9Iw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ihMpdO2b;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.45 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WzLAc+J/m40dt2UeUPpKO6R5lHrwt2nBKCYPlZ0N4fY=;
        b=Q0SLwOcddHOuV00/uTKP9qYyq5eY02M6erxNFfvfFnXEi3yXyOoBn71e6f9NfyEEem
         IfrfxG8xyJjswyveCNHEXe9KNzF+X/QKr6xxolCHAQD1iMPbQ1kZPOz5EbdNo14tll5F
         Kf02oW155LCwnUaDb5CfLBch7VA0YI/D22qmfhW7156ZYFnoMDAEtGC6i0YZqT0b/KDO
         4M8fFcF59oeSrqcIDUi6Y9+WYrOL4leDYX9ncEmsO8qNryYfBZIty7KbVMTCf8WymDqx
         R7fQAWRvotCKI2J23CHvb5DLBMH87pkSL06r0JLkIMRf+kPLKD7+S1X84SqD9DzPHPA3
         ClSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WzLAc+J/m40dt2UeUPpKO6R5lHrwt2nBKCYPlZ0N4fY=;
        b=CLgIfdqYL4n8l/3vc0A66c8Or3fp8AHYckj4q4l67swosNFJ1P3lqxnZck0i1D7Ijp
         rHPhyxA8Wx+XvCT0bKWw5Fof9y2SBMjOa4pays0yKy3DbruBsDRt376zNxJpOB9zFC22
         WyHMKEucsk+40ljOFvFvbaKdE9+r70RxhbpeBF11QNsm1lswKRRd86QG9T5zDdfHYMQY
         mYp7rkGN9ErnK540uR46JLXHKctL2zT7t8GhtknuowsyopjuHZ3LtGk74r9ydQAJZ4Zc
         Q5ZfWSeWA8W7MPQ2eKpjVMRi2+VdC9hss9OU9zMJ6sVQNDIfobztJdyaig2WKttKiMTA
         ZM1w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kpXqaVsg+JRRTVClGuLQez6owNnd9rvfhhVxdDrSN1WsTf+o9Fa
	MbI9OVmbhrnyukHrbT4oZtw=
X-Google-Smtp-Source: AMrXdXspnzntiwghKtFFMxHxHTcoFSArLK4a50toEdQhQY9zjmcq4fZLnEbX/6ZBINeylHSR24Y0Cw==
X-Received: by 2002:a05:600c:44c9:b0:3d1:d771:373 with SMTP id f9-20020a05600c44c900b003d1d7710373mr2318963wmo.18.1672707445419;
        Mon, 02 Jan 2023 16:57:25 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:790b:0:b0:3d9:bb72:6814 with SMTP id l11-20020a1c790b000000b003d9bb726814ls1258054wme.3.-pod-control-gmail;
 Mon, 02 Jan 2023 16:57:23 -0800 (PST)
X-Received: by 2002:a05:600c:4191:b0:3d1:fcca:ce24 with SMTP id p17-20020a05600c419100b003d1fccace24mr29081162wmh.32.1672707443691;
        Mon, 02 Jan 2023 16:57:23 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672707443; cv=pass;
        d=google.com; s=arc-20160816;
        b=BWM+AqQ1ahL/pjn7qlereGAuvvgLV2wBEitVgVYE2irqMXrfSkbMNBd2dBMhHEtg1g
         hmb1kDkw4w1+wpaMt8Vc7N4N7AOBRSG/sbNLnTBC1qL/YIGaGb6WS5cvoTJuLUo8Jnqz
         2He8W4guQkM5f33np3oIIpLrSL+ntrY+A3YQnjzQsOCzLwxwTLt4StpW7GWue4JPaPAh
         eFljA1gI0Y0a36YkKl1dDa1/7PYGMXc8kyx0YVFJufSkJ1HVfWO+mHlhdjLMC/iPErOy
         QcgsbbtvyvXJxyqis8KzAMAPhVFJVUCqRw6kbBQiA3qF74++5Tw5qRCWh1XTWeH2DKYt
         2oFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=NpyVVt1Stzqcs+gbccA4RSKK3Yf23aLtdeo5qSnO7Vk=;
        b=PTAoBEuULOXTfmqtzn/lqkUXoSI3d1gTLmfX9ijSsovVsfgWNN46d2QGKc05R3LWQs
         KgnITrgdZ3WKB5XbSbVdl5RNdlC76DmB+lsIKPmT7pPMTHjkHxs1gb8D1J+YcVerj4/E
         RO4ofcZ3FmS6Shc7jgG1xaxc10oZXcCnaWs+V++U3P+hsHezC08cnKvKR/RT0jhsZyPR
         D9gl7WqDoqnvlHHP/jTTWuIeUMz6y4rf5VLF4pmnuYzQ420vS4GpQVcuJ/NJYH9mQZhf
         /yhJXiD84NBYe9muZi5vaKCNHwq5hzCTZfn9t6RKlF4qBC5EwAZSw3GaV240YAgb1tMY
         6nqA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ihMpdO2b;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.45 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2045.outbound.protection.outlook.com. [40.107.20.45])
        by gmr-mx.google.com with ESMTPS id l17-20020a056000023100b0024222ed1370si1171117wrz.3.2023.01.02.16.57.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Jan 2023 16:57:23 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.45 as permitted sender) client-ip=40.107.20.45;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CC1a/X6xexDnrnou2E5dRrwZPka+ZLr/7/8EdbG0xu5i3SNL1Isooi7eDvWwXM0Tm9XNeGlFjnd2G/paMvsLwk4+aZNpVyIQUry3f7lJDzLia9LWzXCMdi5mrEbpu89oI5ExNtFt4GujY9TRGzDq5zixyr4/Bk85VmlyVkVB0a2BA1BoGT8lmGJwTOAMRUCVxd5W/xmpi5upybLrEmAtzsjcIgpsy31rxVJI9Qzt7FGI7ur1Q+rGzLyjcAX3f504MxZDeDGc69v/kD69LtIieWaBh9fHbA6PPlSxEOjnfzoI66MwEnvMoU5A8nvNZofYz4SoM8i1SVjPPmq7F1i1ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpyVVt1Stzqcs+gbccA4RSKK3Yf23aLtdeo5qSnO7Vk=;
 b=mG4EltH/NixWetyzYwUFWdivM48g++ZsbFxaIp7yDTd7K0GuaiylXnle5006xsrrzZsBbsz5BZZbB6J8IrQ7OQlC9CW3jAt1MsuTGqPkIlftpQYUdyr4GeSFgIDmvtpRRn1HIPY1wolbjyCvhrbIwrTqOl6pH5gzOKWJuKZhSbb+UaaQFW9WWZqf+GbsbsAv1kXsuFLeFPUhQ1gX0MPUUJmzlsuDdmVZINI8WJNlO8I1crevFXvvilqWMeYYEoMih9uvB5cIFzZXxTZJ97T78N84u0NJp4n8iiv9H07O92tgzoQJhHpa2d3MoRbefOC5ie9sOQJAhPpMekWA4Yi0UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAXPR04MB9217.eurprd04.prod.outlook.com (2603:10a6:102:232::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 00:57:22 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::29b9:5061:2054:174b]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::29b9:5061:2054:174b%7]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 00:57:22 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: Question: ivshmem-net
Thread-Topic: Question: ivshmem-net
Thread-Index: Adj9dF+cz8Ds4ZUVRBa4XAFgTKsKHQhCWCuAACQO+9A=
Date: Tue, 3 Jan 2023 00:57:21 +0000
Message-ID: <DU0PR04MB941785140D4F2A6620C2AF4888F49@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <DU0PR04MB9417606E9DA7F4D450E98990880A9@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <b8ff927b-a86e-9c92-e834-a8cdd790a679@siemens.com>
In-Reply-To: <b8ff927b-a86e-9c92-e834-a8cdd790a679@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|PAXPR04MB9217:EE_
x-ms-office365-filtering-correlation-id: 0d1db8db-c174-4d5f-beda-08daed257890
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lHCEBPCAeZ6/8y9uVKXTM19n0HhCr9b5F/n9ewkZe3ZCwnkoHtZmSJ5ZDUbl6xvMKWz9KWQjXUqL3kkLNpCIn/bJfl3Ysr+YOJYT+YhPxNGZ6pdaeeM4FbC2M535X8aLgtUSwYsA7WQ5GYUVlzyOj4LOmvQyt004IDI5ZhkAGjMuly7zqAPeQU91hjbQwuUJ6r8TC6EkgpIKy4aqpheFsJ4m04xfCUn3fUIzo278BPShPVlcCyw8F2YB19PRHg4yFgpK1nX7fQpwRw+JWEX3BhHezCgQSuUslJUFsNoPPc5wbp07uZetFVs6VoRWZEF9MgD9N4Uu5C362YlVemQBbwUsOaPq8q0nHZgecweYmSWbczeFulRy6nAhdWfAq8VFRrLKJeLQa20U9aOexR5UXzQgI/bO+OCtAT9pRCBJYVyE7wgkHxnPpYqWo2hxSQbWcMjdpLFNy8NWgZ8X52QYgOd68+W1Oy2luOCzBaY4iTg9puEGNC6aobfiaOeRT+30JDVZ7JyKJFgReqol9E2bs1hjE10BbDnNNdCk0wUmMytjiZjMmdVoD6fFxaIRV8WgU07QlprcoO7j4M1xu+R9E7cvxdCuA/zE6kY0qla6m1LISKEHhneYaO8tm8b9kMl5DzXoo8XWgNjsUBW8SyV2X5VJuwXaIyB50h1GVE/AfKAMFdoxd7bsPyEIcokBbO5YdflT+6Ok6kzE82NoukhqvvHvukDw3k/bBR0fYVDHCDFQvSYU+axMRByOjRNYzlVX8EIr1KH0cxHFiaku+6MUSn7FLBPibAZB3qDcXF0dGBU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199015)(7696005)(6506007)(53546011)(45080400002)(478600001)(71200400001)(110136005)(86362001)(55016003)(38070700005)(38100700002)(122000001)(9686003)(186003)(26005)(33656002)(83380400001)(966005)(5660300002)(76116006)(52536014)(44832011)(64756008)(66946007)(66476007)(66556008)(8676002)(66446008)(8936002)(41300700001)(2906002)(316002)(22166006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?F1CYsWUEOr0zjKM/0Tl14XL+DlS4UjfmCZNmyHIzszGv2iV08E4sp9R1jN6g?=
 =?us-ascii?Q?eZmkhu0jLAVoXkx4sDHuDhJxcSmQaMGYNraPil8vabZ6gSF3fUqY874BYRma?=
 =?us-ascii?Q?nPZWWkZBdIxoiTu9x0S88hX/pH2VaqWdqRKZlw9Von4jN6O346gPC+YaNMvb?=
 =?us-ascii?Q?IEs2m/EK0RbUw4xY0Bqhs8Tm35Xchmp1CczwE2t5m5RTrxV2nUJR2R4ZACvI?=
 =?us-ascii?Q?VG0UDDW2AVgQUtFKpHl+6wusWUp2SLcFRR5JHaX1YYD660bJKKrhjSpzgtT6?=
 =?us-ascii?Q?9QhBiYGXSji7S7K85MnIi3lEJmdaHwOSBAy1zy8kjwFXloE5kpHKQ3oMbgCD?=
 =?us-ascii?Q?2jsNkl+6pqBGlI3Q4tK3E0PQg4VOwRA4y5q0GA8bLH91+k2ZGSBGtiFv1k5q?=
 =?us-ascii?Q?BF4agiF89IpjG3DL36N0B9UxKdF3WcZBV0RKnY3DVyva7z4gifIymkL5LF9v?=
 =?us-ascii?Q?CLVehLbKZ5J/ClAyPI9gMylu0rkU9Uo7bLW82N+6ciDgpMM1hAOHz6M1siMO?=
 =?us-ascii?Q?lobbTAuR3oq1q136xEECdu3msYFu0XT126YMnpoxQycJFEEvUYS0asGzi1LI?=
 =?us-ascii?Q?+uZkFq5fZUo5FzodVzbiv2PhI53J809SB/bn/73yDRCHoUntdNpJzL8qsc2d?=
 =?us-ascii?Q?G0IAyvzYa699BqkbU/yuyWLKGYBrkSlUZqkGD+fxcczZC+r823RPtN11OHNN?=
 =?us-ascii?Q?RKf2vXBLpSscmeL9lCzWDeKas1x4o2hOyEjSGkiR17Hj7dEzl9Ed1XA/AygH?=
 =?us-ascii?Q?p9qd3gRHiW4HZueG5CuL4GpJhOh70gzGQ91uxNb+tbAjhrgR0dBnrpePI8Mb?=
 =?us-ascii?Q?uZ0Hyji3kxo6c0bPL6iB/JEaLDC4x6lV1s5Zcj97fGmMYfkwEej4slboBEMH?=
 =?us-ascii?Q?jlYgleU/lCb70IbZpKP4hVB5fG4zdQWDK2OT2B4UYjisrOAkrX3Oidz+NFAG?=
 =?us-ascii?Q?FmZb4V11NRbu0gv6LDmGop60FJji01nEnMZPiAb0Z+65jxJstydK4fJ9DVMB?=
 =?us-ascii?Q?W/EhND/q9TVSsrTAVp9b6aHivW9vJMZ1bWuAIBQPC8USmlRmIEpGn9sADWXt?=
 =?us-ascii?Q?Is0rC4K6mSZAu+uU9JxUi1ho5Xb5F5TjR1nnkOjuQlWe/zZjPLA/Ys7FoyM4?=
 =?us-ascii?Q?vDhhp57nHYrKDaii+p7K7hLfvdJ+TmaJ/+XG7ojsLw3ulG/g4J8EfS47fZil?=
 =?us-ascii?Q?3pvFjW2tjjMVl7wkQvMmb0beOXDgUj01eXJ9spV9cTyJlzyxO0WyMDJwPDg7?=
 =?us-ascii?Q?9L3PYxkWFVV69Ijz5CyPIMYRCMdGw2Bzia7joZcRPO6viaISoLmGFFggqMZi?=
 =?us-ascii?Q?1m1GvLlnSyqecCv8I+GFnOyXZKCblfYn6H1FpPVeo8u8sZC+xCRz+fg2YgvT?=
 =?us-ascii?Q?UITq74WM5Aj0aF9C9eD2rygNkG54L5TxOeu7ag8CQBMUTIaE7ZaFR5XcHDD4?=
 =?us-ascii?Q?k3kedDufabz1IwesvfiDHss9UDWbLQgBPJUkd+Ab5hzzS3hZCZ5+ueNy0kCM?=
 =?us-ascii?Q?NlH97axlpahEezX/SRU3ipr6EGbdT64oLqHQLl04BemKeLOEqbBZ62l8Ezjs?=
 =?us-ascii?Q?SjcwzQyhTZxV9/kEH5E=3D?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d1db8db-c174-4d5f-beda-08daed257890
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2023 00:57:21.8358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9+o2wRpBeYiji3t1oWaGAVY242OPRjinlSbkU224MZ40LmSlxfVh4W/nq0uAwlpgMb6a6XUbYM7dj8vPIGpcXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9217
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=ihMpdO2b;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.20.45 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> To: Peng Fan <peng.fan@nxp.com>; jailhouse-dev@googlegroups.com
> Subject: Re: Question: ivshmem-net
> 
> On 21.11.22 07:47, Peng Fan wrote:
> > Hi,
> >
> > I have a question regarding ivshmem-net, not sure whether we need to
> use local_bh_disable/enable to guard napi_schedule.
> >
> > See below patch:
> >
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatc
> > hes.linaro.org%2Fproject%2Flinux-
> usb%2Fpatch%2F877dk162mo.ffs%40nanos.
> >
> tec.linutronix.de%2F&data=05%7C01%7Cpeng.fan%40nxp.com%7C10674af
> e061c4
> >
> fbdd5cd08daec94e54a%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> %7C63808
> >
> 2421486787248%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
> CJQIjoiV2lu
> >
> MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=nxYB
> 9%2BjoTRb
> > hTF7GGaa32nmr7hU7zCk2fEOL5ZbbL34%3D&reserved=0
> > "
> > The driver invokes napi_schedule() in several places from task
> > context. napi_schedule() raises the NET_RX softirq bit and relies on
> > the calling context to ensure that the softirq is handled. That's
> > usually on return from interrupt or on the outermost local_bh_enable().
> >
> > But that's not the case here which causes the soft interrupt handling
> > to be delayed to the next interrupt or local_bh_enable(). If the task
> > in which context this is invoked is the last runnable task on a CPU
> > and the CPU goes idle before an interrupt arrives or a
> > local_bh_disable/enable() pair handles the pending soft interrupt then
> > the NOHZ idle code emits the following warning.
> >
> >   NOHZ tick-stop error: Non-RCU local softirq work is pending, handler
> #08!!!
> >
> > Prevent this by wrapping the napi_schedule() invocation from task
> > context into a local_bh_disable/enable() pair.
> > "
> >
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore
> > .kernel.org%2Fall%2F87y28b9nyn.ffs%40tglx%2Ft%2F&data=05%7C01%7C
> peng.f
> >
> an%40nxp.com%7C10674afe061c4fbdd5cd08daec94e54a%7C686ea1d3bc2b
> 4c6fa92c
> >
> d99c5c301635%7C0%7C0%7C638082421486787248%7CUnknown%7CTWFp
> bGZsb3d8eyJW
> >
> IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7
> C3000%
> >
> 7C%7C%7C&sdata=g%2FR48KwZCOVGt6momplzAv5VwmWpykE6c0e29pCpv
> 9k%3D&reserv
> > ed=0
> >
> > I draft one:
> > diff --git a/drivers/net/ivshmem-net.c b/drivers/net/ivshmem-net.c
> > index 3bcd39b91176e..81e19d80bd0a7 100644
> > --- a/drivers/net/ivshmem-net.c
> > +++ b/drivers/net/ivshmem-net.c
> > @@ -558,7 +558,9 @@ static void ivshm_net_run(struct net_device *ndev)
> >
> >         netif_start_queue(ndev);
> >         napi_enable(&in->napi);
> > +       local_bh_disable();
> >         napi_schedule(&in->napi);
> > +       local_bh_enable();
> >         ivshm_net_set_state(in, IVSHM_NET_STATE_RUN);  }
> >
> > There are other places calling napi_schedule, but seems no need
> local_bh_disable/enable to protect.
> >
> > Not sure the upper change is valid or not, please help check.
> >
> 
> Looks suspicious, indeed. I wonder why there are not runtime checks in
> napi_schedule to detect its needs and report a wrong bh state.
> 
> Does this issue only trigger with NOHZ enabled?
[Peng Fan] 

I not tested other configurations, but I think so from various
lkml thread reading.

Regards,
Peng.

> 
> Jan
> 
> --
> Siemens AG, Technology
> Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DU0PR04MB941785140D4F2A6620C2AF4888F49%40DU0PR04MB9417.eurprd04.prod.outlook.com.
