Return-Path: <jailhouse-dev+bncBCY4NF5G6YJBB3PKTP7AKGQE5W2DEGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id EACE82CB293
	for <lists+jailhouse-dev@lfdr.de>; Wed,  2 Dec 2020 03:01:17 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id r24sf86574lji.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Dec 2020 18:01:17 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1606874477; cv=pass;
        d=google.com; s=arc-20160816;
        b=L3Dw4erfGjOaD8isJPLI54hi1C3nEAWgyi8k1N/VObRVOhQfYPasWBQDGVpdh/f2HG
         xG1NeUB+OWsiVE+qCfLG/hjqwHvl/hu41sJNvI5JvW+m5yCjvI78oSpNQh5ILIl05Ttf
         0Ysa7cg9UPDnSoMgh7CsZ2pRz1CvCVrjXUDPwcFahU2d/n59vFOE2aXIuhXiqu0q1wdU
         uNhhSXQSyNKLUQ7U+UfGhsaFcq5yX1Qt8Pv7e4GK6krvVXnDfbLSjoIJu9nXajqj7H0t
         wxUzIDp+vJLN9FNbNzuqTqeyqOhJXGe08+jKhe9alSjELcrWjJV8luPRMuKK08di/UwM
         NmMw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=/5NoXxcwg2TZve0ThmkT/4SqumVpEmUMFwIRQTkuOa8=;
        b=FtH+ohxXOrSCieA5QZwBF7KKLibR9mw06biFhmdq+a1kw40+bA4U1g0ufN115ZTWAB
         2HECp75rfOkqNuxpgkdfI/3XVEH4Ho/WqLFvcQWGNtYHuymwd8AA8E3w+5Y+nkRTn82L
         wHMTNHTVs55pBPJ7ZvTJL40Hf3dAlVBzp0/UTrmYZ/G9Ciih2+WqTKnt9BmkKxuBe6cF
         3R2YskMIX922wXYHhCWBBB5KZ10PhsdNHixwxnu9n3hnRAtdILEJetmCYvznVE3A8sUN
         LQ5un277QAMjRqyucQwFp1GAdyL1/0EcIloIz41VnjA5GejHYoptybyXfx7JH0BT+Ndq
         1fpg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="QH/pZ0+H";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.7.43 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/5NoXxcwg2TZve0ThmkT/4SqumVpEmUMFwIRQTkuOa8=;
        b=WsbLi5KQ4EysMsfELOlanDER9wu5veZmUU4niRntB0mUjquaLfGX3CUvvT4gQ5L9ep
         U5n7D6FO2g8q6qGcTo79Ksv7aoQdZ4AyoevHm5vTJXr66lYaie0I0Pw6fwN4jP8t48zW
         0VATx21vYtwhkBcg0jY0tx4MS5loE8JJoyVHPxNQLzl1MykRSz18UV7wd4RSHpd1MO1z
         73Pb/unzrWQijzUuLNwqgnuukMfeJ4FmCjJySTd8wv9Gz6ggvhMidxccyATkaJ6QTK7i
         GHJcjLDozN8ps0JcL63riaOGthOx/m5HzoyLqu0HKF+1uNIN2mTyWRpS/hkxA6ZnJToo
         N/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/5NoXxcwg2TZve0ThmkT/4SqumVpEmUMFwIRQTkuOa8=;
        b=CZtMo/QSxokEwgl57ZGNu0gT3e9PNziXQwwcyCQYYJWiI5p8L1o3wyDqorbZslkyu6
         VFMqXasvAreOaw4M5PXqSi7nABf3z7GuXYRzo7Hr+f5shIWbGwj3dszEf8sf7ro5+Su8
         BPUW3J9WjQBjG8P2udBDZAjaMsfI93ag7KHl5SIYQuoBDN22A0ywgnYejV8+KsmBC4in
         6ZWlEcEjrDfLNV1VWnm6eIGJZHUsMEX9PTAFYeP7Yfzx8g3LBeUGFI+uaXaeqOcPPtZG
         GKfbqo/vASr3LaZJ6gXezbHmCS3EIik5EPXxtMhXp+Zjz8dZ7xSy59sAYAq8DQrjznFM
         OSuA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ytJQ1SlolWupwxZ+JeOdWV89F4jn7hp5+TcMg4vPbQCzX6uBu
	KDZFIxSu731ATzEQMiNBjh8=
X-Google-Smtp-Source: ABdhPJyKMs0V9025CjlmLLUUdZzkXAHz8uSCJBr+qsWgKj+xDTvCiaJIva36ZhYvEy6x2ePlE9FW5A==
X-Received: by 2002:ac2:53ae:: with SMTP id j14mr221948lfh.216.1606874477438;
        Tue, 01 Dec 2020 18:01:17 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:d0e:: with SMTP id 14ls29754lfn.0.gmail; Tue, 01 Dec
 2020 18:01:16 -0800 (PST)
X-Received: by 2002:a19:b16:: with SMTP id 22mr181578lfl.49.1606874476373;
        Tue, 01 Dec 2020 18:01:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606874476; cv=pass;
        d=google.com; s=arc-20160816;
        b=vKNZiHaVx3xnF5drv3gY25K/v80B/s9vIzBWYAw91rFb1nwNV4MJS7p7Y/RY86Oa1E
         Nkb+ppDCsrWVNs7REH0OOGmT3LNtP1aYr4WYJ3uCRHI/SQ4pCDkCBOTnTWvAd+PxVpeX
         MY4g0BWxN6cnnOCknmSlHZcpI37Kn/g7zzgl0mPqaSsqTN9NPo+E0OSKb/bVshSrO7Uk
         NRxggo2jquJ2S0b84myiXrA73Hnz09rL/hnYFy8xQgO/Okjx3wHulPHXkFQp2h/TpEbY
         dFq9WiST+lMgIC5YQ6iTXrDKbBdZ8HKJoZ4k9npIImav0TFQOmlcEfV50oycMnDqSfVe
         pJbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=i55B/25Vmxrfpsi4JN3c9Eo4HXb2fO/k8k8ZikXOWak=;
        b=yF4CeeBTZKchFe4Glp7bI0j2ciioBNZ8heKjYHRVx5m+HF05Uz4INS2TnaQbROauvT
         1d/5A1jOchSS5beTAPpLKcb5gm6FC/vhrFXT/At6Xg25mVTHyMpxmRmPruvJ5Xzs8pzr
         F4wtoO/BbWS+R90SG3vgq8NKPzWyaSYC4vSJQEvICPy/M6aDn6neJTzd03ZvoI9O06go
         ZHGthfD0IEIZn3ABRPYxWwC6FtzPCEHdxY6Z1gS5pJrodC78YD/XEDv/HJkJSkMGBUYL
         8VYV2kZgx3cSBG6Po/hsJRjwWIO3gjT9qz0v/nUWQxnnrCIfTw11GlZllSHNHiXJ3+ju
         GSKQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="QH/pZ0+H";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.7.43 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70043.outbound.protection.outlook.com. [40.107.7.43])
        by gmr-mx.google.com with ESMTPS id f9si8956lfl.3.2020.12.01.18.01.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 18:01:16 -0800 (PST)
Received-SPF: pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.7.43 as permitted sender) client-ip=40.107.7.43;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTf5/aZf1gqQofP8MBOsuB8H1C5bsTsIboI2tHVQ0uAhBLtfP07ITU7ZgdZKtd0riPQbFwv6X43bDgbfWdqHQdhP9YSmfssCuANs83QlYACS5AsuG+jq/rrX+DqPPAwPpAbu7GAaQgE0KXKS5zkcdXTRXg1K/cgM42+UFVXHITQ8v6z1oG0d2tCBCl+M9yHrSGa/XQPN1Z2j3Px88qX6RnZx07DsQfUN+qiC4TdFRQFQOF+XWdG9P73J1g3c4adonxSBiIR6l7UkiBTSEE1eE7k784dx2ZxjV5iGiQJYDS5yw7DZC0cVl0j3Khzg3bQT93vt3Mz7+F8QX8UdQHZEmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i55B/25Vmxrfpsi4JN3c9Eo4HXb2fO/k8k8ZikXOWak=;
 b=Ri6NkB43PYio8+Ls7R4MOZS8TaYVDeg1Vh0hdQW4dbk73mJaVxGkW9Cm2Ccy0izhWm0vtG5jvGUXFAGSBQNUvW03DhKMqw43o9Ql2Nq2KNMEBl0alRIE4sh7x3BgKxB+Do/YhUrKrruA172x9SmXt+LDWY7DTSmRdHXVAWx3O4sJ8VNvetLuFd70gWreOek2n2f/w7IDHo10EZE1xLRhdo1XMlnE3TZV0XoCDi1XXXVID7rMU+BtF7Km0VqGV95odo8RIz6cM5JnTEX77P91yk95SDj+mjOLQT9w10ZJzm6OlQr/i1+YbWXuFOCd2BleGL2TAKp25tyd72MGxCcL4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4772.eurprd04.prod.outlook.com (2603:10a6:208:c2::17)
 by AM0PR04MB5202.eurprd04.prod.outlook.com (2603:10a6:208:c6::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Wed, 2 Dec
 2020 02:01:12 +0000
Received: from AM0PR04MB4772.eurprd04.prod.outlook.com
 ([fe80::749c:710a:a453:8795]) by AM0PR04MB4772.eurprd04.prod.outlook.com
 ([fe80::749c:710a:a453:8795%2]) with mapi id 15.20.3611.025; Wed, 2 Dec 2020
 02:01:12 +0000
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: jiafei.pan@nxp.com,
	jan.kiszka@siemens.com,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH v2 2/2] configs: ls1046a-rdb: Add linux inmate demo dts
Date: Wed,  2 Dec 2020 10:09:18 +0800
Message-Id: <20201202020918.27120-2-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202020918.27120-1-Jiafei.Pan@nxp.com>
References: <20201202020918.27120-1-Jiafei.Pan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.73]
X-ClientProxiedBy: SG2PR06CA0182.apcprd06.prod.outlook.com (2603:1096:4:1::14)
 To AM0PR04MB4772.eurprd04.prod.outlook.com (2603:10a6:208:c2::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.73) by SG2PR06CA0182.apcprd06.prod.outlook.com (2603:1096:4:1::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 02:01:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e8386282-e56a-4561-4a69-08d896662501
X-MS-TrafficTypeDiagnostic: AM0PR04MB5202:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB5202A49C5910410E70D2CBC68AF30@AM0PR04MB5202.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F1E7Pt+VyXqMNkXuX06z09xqsCzeFYISLKWA1OIG5+ux5UZKZaPvoXz40qEtEfsH14+OnO/iFKdaWkY4h6xyEFvZ/POwQiSEIOL/tColHHZPRpM5Adn95vGM7rq5scO4ZojFvXjeo9dawmSr1pzSnT3HG/vmiBACuFty6k8D+3f4x4wGR68MEwr+FJAGVMFoIkLedvIk688PMtOi1yXRpWuDGg2xx32gIS83VCTdDeIYgR1M/xJOR+bVMiNnqWcCkVh3qdoPD04GzKB/YT8fzFY4GtWR6Hpu8ho2p+fD9MWJSjly68u4fjEFIK5Ib9/6yzHtSoXi+pl8nO66SvuRydb5ntSuiIvfXHRI4OR73e0JeBZhkrAD5JXAlNBGYvr0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4772.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(6512007)(4326008)(69590400008)(52116002)(6916009)(956004)(66476007)(66946007)(66556008)(36756003)(6506007)(2906002)(2616005)(478600001)(16526019)(83380400001)(186003)(6486002)(8936002)(26005)(8676002)(86362001)(1076003)(316002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Gph20S22KZbMsS9Xxz3g31y9ecYpr4FYvx9uav5hg1D39KDffdjYVfFJ0p2V?=
 =?us-ascii?Q?GuI9kVy17H4ufpf3+cGT2sI9SCEsO1obhWfJMj4rAqkvBGWXP7TclPDd3pDQ?=
 =?us-ascii?Q?rrSxGT43txoEIhMNcYaPRrsZuhrJBSTD+mi/Tcs8vswvIIqH6BI8hJGZrKQ6?=
 =?us-ascii?Q?9M3KaxDcSVqu9rTfMYfMkA1tOLl6UWwqOxLu9oVOS4yzbAjursWhcPqWZRHA?=
 =?us-ascii?Q?e6VSkvBWFBOrqo7Pg7gFhd43e01Qs0CEWLb94KpLOVo+hi/tytu3WCJaoJco?=
 =?us-ascii?Q?PDnPxA2XYG27hRCpLU5MxjiHyoMHY6ToNXItwb+zRo1c0e0eEXcDYT09Eul7?=
 =?us-ascii?Q?IAyskQ+wT7eNu8I40Fx1De+c6GdUt1OUdp/pG5SNsO2IINR/csqw8c0Q96sy?=
 =?us-ascii?Q?FKQE5R4+ubkQb1QDLPRV1qghq2XymHw5OxndGCY7SqhOS/n8/3I8wxMUU+wJ?=
 =?us-ascii?Q?xQFK4V+MMAOvKCMpD4Io58LE7uLUuiRgRZnvyMuhws4y7UpvQAuxFAoT+w09?=
 =?us-ascii?Q?KCVtnuR9osMHJrZrKQqM7loRsOS07Oq7vwueufq7TuR3DdzYQchY3GZkDikk?=
 =?us-ascii?Q?ukROx0FbkSjNxfUzd3V3Gkbi+3TmEFpJr455WSTO3YUwp/uKBj+og6krHePP?=
 =?us-ascii?Q?oh9AzafQG045QA8DzYxzCa/LQuHbxaV5OxqQB95NkCS/GGMqIHqxSArqBnlV?=
 =?us-ascii?Q?XFbEbBVPUW5L9dA31SkqpVQYUFFOFDlrDiwfzDpYZJRgtw4QEeJpSSx6VOk6?=
 =?us-ascii?Q?WDNUOefttkzTmlEZ6FFo0cTa6r9qWsEyFndRjH97M1VqcqexCYOQNRUnaBGo?=
 =?us-ascii?Q?mMNF7gaqI2KC6zlCx5lFg6s3yrTW/nj1A9h4fuogdeSV8vT9HxnruKBNLwO8?=
 =?us-ascii?Q?3jKjlCYFQn+o6zyoOOjVK+iqdmhyKYKQfCR/HCwqVyLbtNwicq34avWEE8IY?=
 =?us-ascii?Q?vVA0JHarTFHT/gNgY/Ah+koAPdrH+XhNXTijCbdOGlgJm5yxIZa7Bi3xtV68?=
 =?us-ascii?Q?hOG1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8386282-e56a-4561-4a69-08d896662501
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4772.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 02:01:12.6886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ykqircBHrYgAz7BGIyEDVXkiFW6jrDpOof+lllsT0NeYkhN4ySvSiqx5imOmSDo8oJbb3YBrE6hoMaIyR6ImOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5202
X-Original-Sender: jiafei.pan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b="QH/pZ0+H";       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of jiafei.pan@nxp.com
 designates 40.107.7.43 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
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

Add demo device tree for running Linux as an inmate on
NXP ls1046a RDB board.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
---
Change in v2:
	- Added inmate dts

configs/arm64/dts/inmate-ls1046a-rdb.dts | 177 +++++++++++++++++++++++
 1 file changed, 177 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-ls1046a-rdb.dts

diff --git a/configs/arm64/dts/inmate-ls1046a-rdb.dts b/configs/arm64/dts/inmate-ls1046a-rdb.dts
new file mode 100644
index 00000000..8dcda43c
--- /dev/null
+++ b/configs/arm64/dts/inmate-ls1046a-rdb.dts
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree for inmate cell on NXP ls1046a RDB platform
+ *
+ * Copyright 2020 NXP
+ *
+ * Jiafei Pan <jiafei.pan@nxp.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "fsl,ls1046a-rdb", "fsl,ls1046a";
+	model = "LS1046A RDB Board";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &duart1;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x2>;
+			clocks = <&clockgen 1 0>;
+			next-level-cache = <&l2>;
+			cpu-idle-states = <&CPU_PH20>;
+			#cooling-cells = <2>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x3>;
+			clocks = <&clockgen 1 0>;
+			next-level-cache = <&l2>;
+			cpu-idle-states = <&CPU_PH20>;
+			#cooling-cells = <2>;
+			enable-method = "psci";
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+		};
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	idle-states {
+		entry-method = "psci";
+
+		CPU_PH20: cpu-ph20 {
+			compatible = "arm,idle-state";
+			idle-state-name = "PH20";
+			arm,psci-suspend-param = <0x0>;
+			entry-latency-us = <1000>;
+			exit-latency-us = <1000>;
+			min-residency-us = <3000>;
+		};
+	};
+
+	sysclk: sysclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "sysclk";
+	};
+
+	reboot {
+		compatible ="syscon-reboot";
+		regmap = <&dcfg>;
+		offset = <0xb0>;
+		mask = <0x02>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_RAW(0xf) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_RAW(0xf) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_RAW(0xf) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_RAW(0xf) |
+					  IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	gic: interrupt-controller@1410000 {
+		compatible = "arm,gic-400";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0x0 0x1410000 0 0x10000>, /* GICD */
+		      <0x0 0x142f000 0 0x1000>, /* GICC */
+		      <0x0 0x1440000 0 0x20000>, /* GICH */
+		      <0x0 0x146f000 0 0x1000>; /* GICV */
+		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0xf) |
+					 IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		dma-ranges = <0x0 0x0 0x0 0x0 0x10000 0x00000000>;
+		dma-coherent;
+
+
+		ddr: memory-controller@1080000 {
+			compatible = "fsl,qoriq-memory-controller";
+			reg = <0x0 0x1080000 0x0 0x1000>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			big-endian;
+		};
+
+		scfg: scfg@1570000 {
+			compatible = "fsl,ls1046a-scfg", "syscon";
+			reg = <0x0 0x1570000 0x0 0x10000>;
+			big-endian;
+		};
+
+		dcfg: dcfg@1ee0000 {
+			compatible = "fsl,ls1046a-dcfg", "syscon";
+			reg = <0x0 0x1ee0000 0x0 0x1000>;
+			big-endian;
+		};
+
+		clockgen: clocking@1ee1000 {
+			compatible = "fsl,ls1046a-clockgen";
+			reg = <0x0 0x1ee1000 0x0 0x1000>;
+			#clock-cells = <2>;
+			clocks = <&sysclk>;
+		};
+
+		duart1: serial@21c0600 {
+			compatible = "fsl,ns16550", "ns16550a";
+			reg = <0x00 0x21c0600 0x0 0x100>;
+			clocks = <&clockgen 4 1>;
+			status = "okay";
+		};
+
+	};
+
+	pci@fb500000 {
+		compatible = "pci-host-ecam-generic";
+		device_type = "pci";
+		bus-range = <0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 28 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 2 &gic GIC_SPI 29 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 3 &gic GIC_SPI 30 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 4 &gic GIC_SPI 31 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x0 0xfb500000 0x0 0x100000>;
+		ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+};
+
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201202020918.27120-2-Jiafei.Pan%40nxp.com.
