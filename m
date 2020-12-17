Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBXUT5T7AKGQECZQKWTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8DE2DCCFD
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Dec 2020 08:33:50 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id z12sf2705695wmf.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Dec 2020 23:33:50 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1608190430; cv=pass;
        d=google.com; s=arc-20160816;
        b=oGYpV7Gm8MghcwSkvp/i+7ilxQf/sX/xSO1JqDKzn4MJluaHkLIHBDjVwqWosCt8A3
         yGJoOjSTNPbwztxAESI8Cvx7KC0e5N8Jf79ScCMj1eKjk9g4KZEm9eKLwuRehzFkl2M5
         7GPyGcvbFB42ludSzHBY40/gpj31HJR02gKkYIWU9L8YhAO8mdmLTc397vtEBERHO3ji
         ic1vAPedwRscQcdLLG2zjSOej2p3/eRK7jwtxLfoejepxIO2nYf8jw3RW2Jkry7xbWIq
         ScK6pcecIUQ3TmhwhPsvQPLeuoXigD4VO6Pe0vUDHG+eb6XzSe5KYJOOImJ+M/T4ACC4
         p1OA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=OD36WCjA57du8rTAHC5Y2YKBXAI8B/tAkVFopEkJzio=;
        b=hdHpwqMZGf+0Z/x3Sf+4PBq0fswnDxYiPTt+WMxJKWzcOZFW0IiQ3ThDfaJnLLFEbP
         6mDq+JLVIbW0HYJHn7MTFYpxMHi/2qDdQ2DQsZuBGbDDSdlzJFSu0rWInkgtlOW4teQ+
         xSxUXrD7sfdYJ5QZ+8f688rJpChEWGhKCoYTE597QB0YJI3virGTHLz+//4Az8ZShP5Z
         jJ5CoNufh/yoOW5a2E6STirFnmvSSMDVWx8XUKFawf9oVGQ21USSGfHFABNl5GBpZPdv
         HdCvX3iVpLRDMH3IdWFExILM57FX0mJtvmHY671qc/Z12PtfWjIl8mesH1IGn3g6vHsa
         8aPQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=rkmGRTrY;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.49 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OD36WCjA57du8rTAHC5Y2YKBXAI8B/tAkVFopEkJzio=;
        b=qryQ6pXDAZOOQ4VhOZ3GtYkI9ASFvxeAv1G8FM3TFyDO+bqCquiMJrO6C3Z17hrCMh
         swtGdDC63Dx79QuGgM9pSzX8nTpKt7MlayyK/URIVI5/J9+5vnxJKbfqg08bKBf6K8w6
         w4qHXDg7UKeno6E4239m4qoUZgrtEQC/JR55gzxlzgbEHDhLw2ePJBm3XNc9YPcjA25w
         4ZC5IInFWOkQK3/Dla8GwEBjciqLHmLEnIJRuBlbisteh+aZSkZi0XF6eqmHFUQwax1j
         C88xm2Wxwaxuql/SzrjVuOdWs6PoYRCI6847jTWU7aJNygQM6OjgQAA7y60/ryy/mfoX
         7ETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OD36WCjA57du8rTAHC5Y2YKBXAI8B/tAkVFopEkJzio=;
        b=kPZwcd5riEDoS7gXXkyH06TQaqIJYgij88MYBFR+RaMuvquBDGgRWfgxb+GbtyGQK9
         nOq86ubMHcDDfji+C0UN710srm+otbnGPiYIaPCXOZn1fiaCTTSi0Jw8s1GzQiCnIXYN
         xIqC/dW735ggJ8GUF6Vrsi0pUiz9E7qpYFXu2dhHdXI0vMM7rZo1IMGzbnuxPS+ipgjF
         BlI7j08Xqg0bfiygkfk4+KwZTYxXyiiFNWxd0pC1X5+2LT0ySXCXa08faxv58541YsXK
         Q6Lh+Qt2IOJMiJaKA3AvIrWtuZhwFyx2IPYIYXgnMrkMfm53JQ79tSWM9sNnDyYz/c2U
         w+4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532NKlVKuPAmf6UgDeWI07P7DSEbBn7BXBf6Ym6aPGHCo5ghF8sw
	hDgoZH0ToVskDkzsOUGmgUc=
X-Google-Smtp-Source: ABdhPJwzyWexqtgvo7IM8GtntDDqlo0kHLgr3+C31E+39NNACq1aBDH4v5Oye3NgqbfsC6ZcvBaS/g==
X-Received: by 2002:adf:e990:: with SMTP id h16mr42972467wrm.307.1608190430410;
        Wed, 16 Dec 2020 23:33:50 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6812:: with SMTP id w18ls2115267wru.1.gmail; Wed, 16 Dec
 2020 23:33:49 -0800 (PST)
X-Received: by 2002:adf:dcc5:: with SMTP id x5mr41893880wrm.167.1608190429402;
        Wed, 16 Dec 2020 23:33:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1608190429; cv=pass;
        d=google.com; s=arc-20160816;
        b=FF4+RoxqfY/j1HJVbbJ3pid2uNvJ92OCT//SfQlrxbKsibOoSWWXy0wzFpZiLy5Bwj
         gsr3b87EsYyi3emfLDvoZpL5N8Jk1n2M1ZsgkeyJHLGfF6/Bd3c6ME2st1My0eWGQRX4
         GBhFVg07oH9/vXBArPGRhjvnaqLBSezyGsIRxI6VamLjV53FbvICsIifDKKq5ePobjr4
         O19zL67yjPVJ+j6dzEG47dQmfZBKW1i0h8/Vlqp9ci2ZKfIVSr4o+2NvILKMJzFq6Pzd
         1gOPYVQxLj1g7OtGV9lguUbyVZ4zrTnV1f7Zd+5jhQwbtQy6kXIXO/WLchga6mVLkIEE
         mueA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=0BzSjbxwlGetAap6bwS/qIAQq0y2lpwq8epBPF4ycHM=;
        b=QV2JJP4tduUfUbwXT4b4oC40WfrWUu2WR8ZWd1ad6jiYGnPo51lvA2k0+AKVi5iABB
         sohgPaqqRPVC2TytCUy0FFQrNypQ5QbHUWUYb0uIAFwAtDotU4a+XtWojzhEz1ZXvRcZ
         rnOv9N+HoRctET17NztvRdUisAlIG/8Q4pOWagbsV/REvyYWm1KNsEH33+ZYnJjaMkVS
         l+p97D9g2pg1IYCUTVfKPUQOCNY/Ll/B1Rg6ne55AAwyPWsQ/kPid46eOopCcRmLXUOG
         RoyHoCMlLQ3LWlfHCmx1YpB2LvCqiDSaGsQC08XJmyRrdvxWI1MrjK0r3c+It2DL59sV
         S+CQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=rkmGRTrY;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.49 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80049.outbound.protection.outlook.com. [40.107.8.49])
        by gmr-mx.google.com with ESMTPS id 6si197946wrg.2.2020.12.16.23.33.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Dec 2020 23:33:49 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.49 as permitted sender) client-ip=40.107.8.49;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwnnJchZnC/Ce8fzwQh/gpNWO3NMjQ2+P0ki8fsV2jJnpKMJIOnCLH+9lRTCZuBVOoFyilaafwXsmLtX9s0AoPKqMbz73Xo5YFen73VCaaoiuxkG+ddEKJvJYg3rpmG50xPYZ62isxuaqch4Z5ap4u67G/5SVebfdcTUj4ujkjU2alwvGQFY3gvM1bsY8NhkJUg+JiJF4TmPVBxcq2L6wNvfnG0pGAEhkWMVqslR/LvBVTOYaHJ7ZLXymrJIiKl00rZnLtHMmYptgyBmdQ0VTrGg3I9TsOodcEDJqjUjuf5pEe5kjSgDLlWHh4I+BhP9gmPMbivJFR9Fks8uCCrwxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BzSjbxwlGetAap6bwS/qIAQq0y2lpwq8epBPF4ycHM=;
 b=gMKlsEh4HfZuwTqYu1sbtHjlqtuUe7Qyod/t7iLA3iaSEsNuVci4d43ibQKuyTreexbygIHA43ICRgiphZ1+khblnrtaPSkp8pKO6jBQ6ZO4kCSGnnwaq2eTZI22fOXyT/RS72NkY4QW5HhMKraII6ZOCYsQOvgkT62BZwIP56UfBaHhplMMmT7ugwz3VhPysCHH1GMF2EjgwqgKoqTeFzxBMMdokF5Wz5+YTnyCjaOnmXQsPI/Xbhqm9lV9G5z/Ruqws7e979kYVqkxgSvPAmcgNNGctWe9n1xggsZMRVC7qD+wtQlSKolJ0q09OUzjVIH5A7vMeqD4/OyrWrKW8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2934.eurprd04.prod.outlook.com (2603:10a6:4:9b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.20; Thu, 17 Dec
 2020 07:33:48 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 07:33:48 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: arm64 zero exits
Thread-Topic: arm64 zero exits
Thread-Index: AdbSsg07Ih7IhzzqSB6NTgER6LavbwA/V7YAACK+zLAAArn5AAAAVZSQ
Date: Thu, 17 Dec 2020 07:33:48 +0000
Message-ID: <DB6PR0402MB2760A49D84148C0E3EB0344B88C40@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB2760E9A43F64FDA9DE46AA9488C60@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <f99a10d5-db9c-fd70-e0ee-87aabe30e596@siemens.com>
 <DB6PR0402MB2760BEBB2CD916A46AED7D5388C40@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <23d9342a-7ca8-1d15-be0e-ee1d38e9580a@siemens.com>
In-Reply-To: <23d9342a-7ca8-1d15-be0e-ee1d38e9580a@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a2336f9d-ffe6-4bfc-6dfe-08d8a25e17c4
x-ms-traffictypediagnostic: DB6PR0402MB2934:
x-microsoft-antispam-prvs: <DB6PR0402MB2934EF4B202F280006BE694F88C40@DB6PR0402MB2934.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5g83eCOux8gimnnPQgSy4Xt4HahS60KZfyiqK//J9sDfkNu5jmytlfshqBoipeRxKMEQv1cFjzp/zca2FUF5kqVAXs6t2npDfXJ8NIU1UKHkJuYU70Kg+HKNOn9Z+wGI8nJscyTmyKN5CWBUkvnR99RQXjS8v3cp6lxO9stqgIDdfA6HDDqbmoihI53nFQS+X9oQI4NAlWLnvK6q4cpferdDF2Fa6jKaoRjJtKRPs7YGGRei4ZBeYXV/AAQ+QpZxAlXr4e6vXUyYbuf5DTvae3sqxkUFmLZrO+3GzEa0NQdq8J4GQG+9ieH/kDUrzicN9T69EGUYSs7A3x+x/c/6ABzlSdccCgjPg351RcWN2wCpZlgnpGmsZxYD2qnidOH8Rh49hLDsR4j/q6mNJRNELg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(26005)(5660300002)(66476007)(71200400001)(52536014)(966005)(66446008)(8676002)(2906002)(8936002)(7116003)(33656002)(86362001)(44832011)(66556008)(9686003)(110136005)(478600001)(186003)(7696005)(6506007)(53546011)(66946007)(64756008)(316002)(45080400002)(55016002)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?yh9PY2F4TqiqeNPfzhAgTRvUxrVQuwG5PNLSk3mFwui/joIbfxNx/vzIS6tI?=
 =?us-ascii?Q?/Qijgod/+i5YDTYi4w8BEpvPi8eQoWOO0+B3TtgCMCT/PCDwUn1g0qbbdUa3?=
 =?us-ascii?Q?Px7OiVF1CNZ4Ggp4iWvAP0qvXg48L1Y33HGrP23+WI7zgxF45PDzUqxFA5Cf?=
 =?us-ascii?Q?4FqzTWMVRxGzAomnDBZYe9IIDtMKj07msMqsLoSPghm76NrOUUyyhU6eCQyM?=
 =?us-ascii?Q?cy1PKvlXCsMOfEkLWyB3y+DSmR7c9Q7bHnOa+pfj2Cww8npnx0L/a7e1mW7S?=
 =?us-ascii?Q?dKIxwiAfOYxjcCZeGtWOMkztCo475QRNOGH6l0TjwUxutEH2Z2ahW1D6dFI4?=
 =?us-ascii?Q?/rs/Hj7O0CXWaT+vHmjcGp2e8jFM8I4aNGxAqZFPORj7DubwuJyYNccBdBVp?=
 =?us-ascii?Q?FXlX0CWx2jYaWlx3TwAbYEBzS8uGu9S8QhC7uhILl0lamAvHf2/cELugnxtR?=
 =?us-ascii?Q?vccBDtMnMbGv5pf87j36p6GoM8LD4O6WUJKjTEnrTJxys/RCyCd2xLGIU+n+?=
 =?us-ascii?Q?Lo1011NrLY+SFJrWlLr8c849gVUb+5JtSMeTwctMqRELzd6uUHusDsCXEnh1?=
 =?us-ascii?Q?NjA5Q5PUjUWOMj1D0vCELwWAYMrr1zFr1kiyf6KDQBLAbVcE8nr18M+uN0oF?=
 =?us-ascii?Q?UNm+KSAfQzAM0PN+vrZOk3512kyal0w46d3laH++NxNTumbtQpAa1wmGp2sE?=
 =?us-ascii?Q?qCavAs0j8A9+ouw5RlnVTfSfid5QJW74vQq1OE4CbJmo7UA+vt6NPEUvljJx?=
 =?us-ascii?Q?NJgBzMJCZpaVuBVQT/MHaFKZkAcXyvv7r+PNkV43B7vPtYBypW/WXuVnicfX?=
 =?us-ascii?Q?bWnVtrQycsxZ8uDy8fCCvcxpNcdUl/jyfJSJt+zDGZ0sk+LB6RXpEzJa7/Af?=
 =?us-ascii?Q?cH6ebSeUhWhO3qfM6pzp+Ts8PvDbDyR3OI/wrJw06nFKf4O1z1RgKDK92BYl?=
 =?us-ascii?Q?6+HHA0o5Tp81pTe2Gus+7PHrmofZMoi81plLaYRsVZg=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2336f9d-ffe6-4bfc-6dfe-08d8a25e17c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2020 07:33:48.0940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J9fC6HYMGk4sSOhXNMUP9pufS/0f5k+Zn65A3GHrBzSqIKU5H8JGcCh+Y8QMJmy0m7sS1TqbdSMj69L1T1mZEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2934
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=rkmGRTrY;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.8.49 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: arm64 zero exits
> 
> On 17.12.20 07:08, Peng Fan wrote:
> >> Subject: Re: arm64 zero exits
> >>
> >> On 15.12.20 08:16, Peng Fan wrote:
> >>> Hi Jan,
> >>>
> >>> Will you merge the arm64 zero exits branch to master? And when?
> >>>
> >>
> >> Still wanted to also upstream the zynqmp enabling, but I do not find the
> time...
> >
> > ok. The i.MX8M part has been upstreamed.
> 
> Yes, I know. But I'd also like to have a board supporting it via jailhouse-images.

ok. All software components from Upstream repo, including ATF/U-Boot/Linux?

> QEMU turned out to be harder than expected
> (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Frevie
> w.trustedfirmware.org%2Fc%2FTF-A%2Ftrusted-firmware-a%2F%2B%2F4860
> &amp;data=04%7C01%7Cpeng.fan%40nxp.com%7C268a38e8c831491f1aed0
> 8d8a25c72fa%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6374
> 37865235884393%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi
> LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
> WDk0s2yyUR%2FdzvJQN3sCbo95hwwWfIET7L85tU9SBac%3D&amp;reserve
> d=0),
> and Ultra96 would be an even better candidate for that.
> 
> >
> >> Did you test that branch against imx8 extensively?
> >
> > Have not do stress test, but from my sanity test, it runs well.
> >
> 
> As we had that issue in
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgroups
> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2F91E9F831-4F9A-4444-AD9A-
> 3E5C56D3CA70%2540gmx.de&amp;data=04%7C01%7Cpeng.fan%40nxp.com
> %7C268a38e8c831491f1aed08d8a25c72fa%7C686ea1d3bc2b4c6fa92cd99c5
> c301635%7C0%7C0%7C637437865235884393%7CUnknown%7CTWFpbGZsb
> 3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> %3D%7C1000&amp;sdata=D%2B%2BcWibTYld0XzGxd231mFh7E%2BHbYji4K
> drtTEbJ0bs%3D&amp;reserved=0
> already, I was just extra careful with exposing the feature prematurely.

ok. I'll give a look into this.

Thanks,
Peng.

> 
> Jan
> 
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760A49D84148C0E3EB0344B88C40%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
