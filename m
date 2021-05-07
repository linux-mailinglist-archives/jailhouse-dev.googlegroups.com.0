Return-Path: <jailhouse-dev+bncBDGILGE54ELBBT4G2SCAMGQE7LQPDYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4AB3762A2
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 May 2021 11:07:28 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id w4-20020a2e82040000b02900bf1f739c0esf4363634ljg.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 May 2021 02:07:28 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1620378447; cv=pass;
        d=google.com; s=arc-20160816;
        b=dkWuP3kMDCS6/v6fJmjtWrnmbyLiWZBKTWJxtaLhzuiPhkVy2BwHmsF3+9gBM+AjeC
         Wo0IN6gK25h1+k5Pj4IPjOQE/R/xr4BBujc3e7aba0KTmt1cMcWB4pdUYAGdwWJxWi+o
         +Ez8HebR3LG0BweZ+0Uw4Kw9cHWur3B6RgFJT5B8y+5FJHZu1EPuama5BfPeSfev4XSx
         8uSqobGiwu3/j5JKGvB5LwESQjFKJORNvqiQOcWdF6cmi+Ytlv4re41MvVni3JbI29H6
         rPZXIAaejzpnlXB5sg4jXNzqxq2EjiAWZXYI26zU/N/DPGaSBdG3sKG+iYm4lp6TyGvE
         +Eqg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=wYJCaoeLHYe2PZeJdfalqwGqngpAysgQAK5f6zkyyoE=;
        b=K81PYBg49BQ3JxZExo2hU7eEYLHp//mNGgpvkRHdXIe06sTUNXAxMRs51kSKXVeg2+
         gzQBSAceeZjua2AOLeTUf4YdNWyNWJjYrE8iCRx/YgqRqcYB77Il/1X4mnhzmhgOpCRJ
         ZnjkEKKGIBpRIXv+HQhEGETF89DgU76GzL34jDd7JfO5NJXhcKPQj8QQqeTrtpeYcsGU
         d3iNagPWu1JHAgG5wMxuiXswBmihlo+vqiMAunHopRUbe25rIp9W3hjy/gvambWUXGCt
         odNR2p8aQcmgF9ahdpeyE3onfAioABXFMPJt/+LymSWGxAFmnQb0diqtl2qQA7VSwl9W
         rtew==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=RzfA+AVS;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.117 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wYJCaoeLHYe2PZeJdfalqwGqngpAysgQAK5f6zkyyoE=;
        b=mjUIBKaBMuyQnFfd7qEc8fFRRT2Sb199VogtezlhmszRGbSke0oGL7uB4Bc5mf2etc
         dnUQHIk8n0qUld6JGw4QYVuCSpGJLhyCl3etgWbiVL1/p2qp/aJGD1J40KS8qc+nOd0s
         QgrGKif+AjjKwQSIw7xWqmNmLmCHjTSlGcCvhhd5F73x3PZKKgaaiAb2id/7xYEhxRP0
         mSxdHFPxcdrD+8E+v6EmWDs+sZ5xfl7gt4au/OTphT/fuW8mZB/EwHsFIcjZNVW2Mko+
         QprvXE3Kd3f0mBAep42VcFND/VCxMEa80/+73jRJul5AA8ISs5sxixfx7rWZUbnJIAzZ
         KEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wYJCaoeLHYe2PZeJdfalqwGqngpAysgQAK5f6zkyyoE=;
        b=IEbwZfRpRvSCTvujbhTuyE3GCKsmmzu/azecqhjQRXKetymwy1ZcvBE2y3dcvp/QJw
         ZzT+kCqdVPLokc9KyzXtDMhOx+h703sHs929HtiJ3dFeE3gtoe5y6DSU4JWHZnZRmxSi
         ilMgmUDhClPpcpZOOeuAU5SSFqSrJxJ+9gNjF8zH8JD1IYinuSPfalGwBh7n1QwzVrnO
         oBVcwA+GCcVdGBny0yHSg54rqe24BCc4tc2chACnu/CCqskVrT22M7GxZH7CzRHeFU4a
         b6DoIw1/rgckwzvev4tPQFssuW7Z527d0BUVAw0OXIQorjwNxlaTZ8P+Ph6oq02YzRIR
         htlg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531UC7BOnop2I2lDGRKoRdh/OH/eLIKlknXsDt0EX2vdbNxydygw
	IXPmLPFnDbckrohLfI5WLkM=
X-Google-Smtp-Source: ABdhPJwdCrAtPVYbNSfbI4olnpD2+rdLiDjDRU4j9OE5mDkSoUqeVLQ06GkBsoFWaHKiXly+fLkrZA==
X-Received: by 2002:a2e:bf03:: with SMTP id c3mr7150722ljr.184.1620378447687;
        Fri, 07 May 2021 02:07:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bc14:: with SMTP id b20ls1160994ljf.10.gmail; Fri, 07
 May 2021 02:07:26 -0700 (PDT)
X-Received: by 2002:a2e:9d10:: with SMTP id t16mr6729222lji.253.1620378446615;
        Fri, 07 May 2021 02:07:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1620378446; cv=pass;
        d=google.com; s=arc-20160816;
        b=qnV+HJyykFmlsQ/5/VGcnKzqPmKYVwtSrzcFUSuLZAHHt0xrUYRvIirp94Pvdlmyco
         6IjhZDrjxCYKQ4FQa2Qa5wYtF1aTcwHwdwhGkmm80Gazz2NXPqOSrPFSe/TcZTUPMRAl
         OexGTSlgOUt1IFIVq7KZ+xzG7+4e14zxBjbc+j7qVcnfBvHOKzneCXiZQ7KxxguP6tm+
         uakTzPgpbndvGCNTNMZPaWXQyn/BQlFO/ZKQ6ena69dkgxzyne93e9g/XvgyhhMROvgs
         XKuI0wXu89gKNSeFZye+Em960ZAUE4GVDpG5m6LBT56IfCyqpWEQMNpisoVTnC7rz6Pf
         A7tw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=uvzzgUcEVER3YXYVEpwgqh2FutI+5BgbrxWIGbU+a6U=;
        b=T57hfwvT2m8+bzhWEzzG1k6VRSlnopLdX8cWE74P0hdmv95osKbTo/uWsKEXhBDowT
         PjTYmiqgBSgmNpfx+WHohkwOtb9z6GTUHHZltDiOemRdJP0fgGIYKCRojRHhzAjOwobT
         RbzTZTsb4L5TCkrA/3cXO7MVHCatMTGGQI6mx+JwI8dryCXgkklHNC/I3JfXpe9pWVTS
         pJXCjOerhfS0FaV5RL412WwbENhRhECnlUKWVhpMB+URfioPOP4mn1OtNyFzhYS+XF0g
         x2OJtExp+/TZnx8gR4eNq9egtya7t3KrJ+L53Ry3hO4Zp/l3+k9DYv9+oeP3Nfowi9pm
         x6dQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=RzfA+AVS;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.117 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60117.outbound.protection.outlook.com. [40.107.6.117])
        by gmr-mx.google.com with ESMTPS id d25si226133lja.2.2021.05.07.02.07.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 02:07:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.117 as permitted sender) client-ip=40.107.6.117;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXwWK9zveFj6ft+AyrwigBXTw9h/EWyeMnqCDmfwCgZGrOYBdy32tBJm3yaRqkrLbdWEcWJspUq7NR/c+X+glFwYqJh+wOFu5rHpqJi5DQVzsY7Cjituuoh0TG9tm3oLZtEonzY9mk1D1M0XK2tuM3fwg/0H25AR0lIiAqBvfudYgu4ok1TVCpurAGfjj5FcXtCOL8Xv+EuPvdkvIGnm23YXfKZ284jQcA7Z9q7ipkQWbLPwVzB0Xm0bwuTJftfkOAyIrnI7C6VjhM7pgtAHiVL0MUUsLWwDiep6B/agh/Exj3qbiEC4vwZ82FgDLaepTkADbirOp+rVsJfjnU6Y8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvzzgUcEVER3YXYVEpwgqh2FutI+5BgbrxWIGbU+a6U=;
 b=EOdj6VEHnaecNmQ66h09T7GLYovPseMby3h84pyi30bPO6sgtE+9LhG1CUN2lrIO1yfq4OJ1WfEiy4S5dSYoEmCulANPIj8xQ0SUyyzLhE18S9fK5+Vp0uxGnyPJQR5lmj3WFWT9GkZCooGjFPymP1tuThnqs0G+puKk6HVUemp2uU9K7WH1cgDRMqfXV5qRoEDuk8NFD2ExXC81lFGRpkK50EJAZxHLhJgibQc6S9MHoLLLT5gd3BzwnC+w/kx2Nq5gP2eqCyCwjJA5hoJ9BR2HM31uxoobEQDzyjNbOK2jeZX2LmHab2RoTSM0c0s9vxHePEkbWymw1lzQ5RoSCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AM6PR02MB5224.eurprd02.prod.outlook.com (2603:10a6:20b:84::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Fri, 7 May
 2021 09:07:24 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::69b5:15e2:476c:e151]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::69b5:15e2:476c:e151%3]) with mapi id 15.20.4108.029; Fri, 7 May 2021
 09:07:24 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Prashant Kalikotay <pkali@cimware.in>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: RE: Can Jailhouse work with CentOS
Thread-Topic: Can Jailhouse work with CentOS
Thread-Index: AQHXQxcf1f9Anhv4f0aWjJD/WkgENqrXtJAA
Date: Fri, 7 May 2021 09:07:24 +0000
Message-ID: <AS8PR02MB666300B8BE60E746F395D53DB6579@AS8PR02MB6663.eurprd02.prod.outlook.com>
References: <299a190c-72fb-1027-0efc-7a45b98bffe0@cimware.in>
In-Reply-To: <299a190c-72fb-1027-0efc-7a45b98bffe0@cimware.in>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [212.61.153.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df13c188-c18c-47c1-1e64-08d91137879b
x-ms-traffictypediagnostic: AM6PR02MB5224:
x-microsoft-antispam-prvs: <AM6PR02MB5224EC24E047217AFA67BE21B6579@AM6PR02MB5224.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6IpFVOYSOLmak/KmYX1e47TWM/UaeOlJ51dosU8FvhuQTvNrEA0o3k2pBEqf84DKgkgrkes9vfRA3Sywrg+vGbeps5z52J2LpIQd9N2PeeM1EIFE1jEbIHud0wFOKYQoo09UOyCZ30piiEnrYBhmNlcE0cg5aZNIG9Ae5TQsdtZVgUG1jskbURDjkHPnWNBd7r0VhBvOY9KkauXAa5lHgu0uZmI76NzKMkPBDyf4GS1SAwkY794MQI7g/RyYeV93YgdqTpHF0XMwBdrIYbvgHR5w3SKTmITrKoPoBz630pkRn3bGRH3iduaSYfBRTSmJgM3hjJFL2j1IDAW88HX+ywViDAoxvp/AJAeKxWbEn/kV+bPnJqb1MlNzweVaBelGsLQYYyo8qeeXxoh180bEynOuBmHmI0qc+5P/SPtzsCppEgupxv6/LhW1kJe/b7zsbj34pNOftwmLmnTCVCABMQcrYxG/lTPWKyGZrXMMqMha2jDBuKLYzH9jWJDtRRo0KpxTebOyHYrCUXgrxjcfPuhR+hy/VLzZJlFwdhQHPoBUgi9RZfnDTFfYCXkJCK0bahBCUh0ssExPndR/mQGO3qnPe/R+FzQsMs3hNWoRt1m4kwLnMkEAnrBfkMoCjMfTlty/W4q7T0rJVL5tjL0H+5UY0jPYJ2/b9YLVWM2qkpNqaSRM9WRks1Mbb5v5gdA0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39840400004)(366004)(136003)(376002)(346002)(33656002)(38100700002)(44832011)(122000001)(9686003)(55016002)(4326008)(6916009)(4744005)(52536014)(66476007)(66556008)(316002)(66446008)(66946007)(64756008)(2906002)(26005)(86362001)(76116006)(8936002)(6506007)(7696005)(8676002)(186003)(966005)(71200400001)(5660300002)(478600001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ppNV4lA7sgB+D8vTTOQNMFrYLAsmg1yg+a/pMii9Qo9EHr4AEZfCXrNwR/YV?=
 =?us-ascii?Q?u0XuO5Jt4CpzMzRQ1f7O1IbUiXNoQg229wMQxttT6XcatAdGHmsmyffpJTbs?=
 =?us-ascii?Q?AYq2QvP1fzdyBT/XrTwwV8S+Qdo+MwhDdiAAOk//vCVPLawmIZH/Ci4SGlSh?=
 =?us-ascii?Q?2D3YFcqTmw0DEFgp0M/Eym/qyJZHFg8AEp6uEpIIL3eF8Ahhxir6Qm8OLwph?=
 =?us-ascii?Q?0nwCC34iJJBvxNuBf2N8bFbTzdGgka8CEA9gpV6A54BqRu814LA/3tY+XO96?=
 =?us-ascii?Q?Q6PW8Pn1LkidkR5gFl7ib0GZYkcOCtZhfCrXwHc1UckUcqJ04Ku6iIuB68r6?=
 =?us-ascii?Q?/8CjxTl45bjk82O7r+8Eug3iZzghyWFg5VQrNTc5f6Lf240/pw1lky0Y0QYX?=
 =?us-ascii?Q?brpYAo00HDqhPLyfajTukWu6FmttojPC8Pp820UGVRJuMxDxOi0PT989ezVq?=
 =?us-ascii?Q?h69Ku9BsvNyfgB1zXrcDkhfun0FTg5awB/SpGpxv52Py5T53tG8wVUFahsb4?=
 =?us-ascii?Q?fgRMSK7TGhct1eRFGZd/gN8DJ/R429dEG9VSQO81SMgefN9/YgU71pWo0CGQ?=
 =?us-ascii?Q?tPcK+Fr176FBdVtFvO24a0RI2ZHtnaFMP9oKwd5GyKj72bN6I8VfpC+79SQG?=
 =?us-ascii?Q?XTU1eZGvCLJkmO3IlFQDfewukSD9YQz7KfrgXtj51FyNHXP1I5rmpI8ayipW?=
 =?us-ascii?Q?0P/aADjGf95kDcBQ5h4cSmaY7O3JFQeGgC3xxFusdQplav4Fd15vf7SeRUft?=
 =?us-ascii?Q?dEITHuEYZRztPP8x9y2AcZurp0szBcXZ6w64b/cQwhw1O2KX0vvS05M+Ppgj?=
 =?us-ascii?Q?q+m0PybVk6t0cBpq1P6iFoAYBQ3Enj0RboiID3gT7lghtIXh1YnBa03/2zgq?=
 =?us-ascii?Q?8RfAGnQ6lHtNnVIbwQ++ul+cd0IHlpkn2O4s3rnxAtcPB1bbYgOcciGtyxli?=
 =?us-ascii?Q?cR3OuEboTOdcTet4Ado9qR8mpqn6LjlQHFIwyQDqnLQVb8eS4U9SNp4j3E9x?=
 =?us-ascii?Q?wsGlChMO7HLD30xqzZFU3ZtCEGPSnjY0dU+9oXflv+mU5SEC347h13cHn/DQ?=
 =?us-ascii?Q?v6qEoRqLiw9rA7iyR4OJ+6jmE8se7Et6EG0/LggDlX5/B5aEm90xiD+T/lAX?=
 =?us-ascii?Q?Jte2DvfJIigVuBiW3ZPKCN6ywQWp73mW5f0DRG/MBshJsWZHf2FC8eu6O02R?=
 =?us-ascii?Q?5Y079AqQoCA+8ro5fRznT1dPhSvY+gjZpTIk0YRZL+Tqv1MezuaqM81PATH6?=
 =?us-ascii?Q?waYCoRMjchQCScE5gg1rnzfNP1AY6+qlbX42AvrZ9cOkbfYUhu8/lswNPnXd?=
 =?us-ascii?Q?6OTxrl2wtB54m9tBjAcmD3WY?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df13c188-c18c-47c1-1e64-08d91137879b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2021 09:07:24.4125
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fCArCX+Un1pwuInS45PMRLhp/gm+c8JhMEsVhBugJCXSUl7arUPddR7E1bZf2plkXYluNyUihHdArOZN+MK54XrlIuhsGDrA5NidnrNOBLMddJ+RyUk6YIu6H65DKu9W01lZUJoZhZjotZ7mS5cwbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB5224
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=RzfA+AVS;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.6.117 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
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

 
> Dear Sir/Madam,
> 
>                              I am trying to install jailhouse in CentOS but the installation did
> not work or it did not get installed. Whereas when I tried to install in Ubuntu
> it readily installed. My query is does Jailhouse install in CentOS or is there any
> additional things to be done to install it?.

What errors do you get? Maybe there's someone on the list who encountered those before. 

As far as I know, Jailhouse should run given that the kernel is properly configured. 
For newer Linux kernels, you might need some patches: 
http://git.kiszka.org/?p=linux.git;a=summary
I have it running with minimal modifications on Linux 5.4

Best, Bram Hooimeijer


> 
> Thanking you in advance.
> 
> 
> Regards,
> 
> Prashant K
> 
> --

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB666300B8BE60E746F395D53DB6579%40AS8PR02MB6663.eurprd02.prod.outlook.com.
