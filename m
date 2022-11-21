Return-Path: <jailhouse-dev+bncBCWKP54GYYIRB3555SNQMGQE2DFBQBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB6D6319D7
	for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Nov 2022 07:47:12 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id a3-20020a2eb163000000b00276fff42408sf3053732ljm.9
        for <lists+jailhouse-dev@lfdr.de>; Sun, 20 Nov 2022 22:47:12 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1669013232; cv=pass;
        d=google.com; s=arc-20160816;
        b=VGw+hh5fkFvWMquo8aT9MwWphihE0FnL6CEgOwyFNd/YERtO9Eg/8PsGx0Di3UKPDa
         5Yc1ILhX7c6DRrchApzusy9foZK9DSqGWH5wD/W1jwLofHncXAERflUPAIn514COqqKu
         OPdP/X3l+1LjWVAkt1/4uecvVbZHAo+E0PERG/ijs8W0inpWBDH0laeI8e6/4HpoO0KY
         +02ltCg59gdcYdX1XjDTtnbWHGmZw5sjiD9EJNXc7NBLU+pydlxHFwbGa5GAhr/tIrx/
         ZpMdWfAj2fhenOLK7uEV0JIH7Wr0ITSGLX/CQR2d/DVBFA/faViAANyUYwuBMkVID+TU
         wp/Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:sender:dkim-signature;
        bh=pYXjqaYqFstpTqCEsQDTxw8PsfJNKGHFx8w7Ze3WmZE=;
        b=oolv92nflO3Iqr7GOdieuBKWL/VX1qx+sAyOmce5F1Y3VVlPP56FrZkGmPCancsOpX
         +9mpjkuzYbNIVDiPbHDM4m/P4y2BkZNqYjSELKPmt7qz1uOnW93Xx+OAZrX0wX1wHK8c
         7bvtS4YkpAysz1WTYXk31GEFS6Pjpz971xnjR9EOgO0agL1X0EC55bwu9tnOoJyeIp0p
         1xHbUOZ62o1SZ8RKYNCAq3pdPV+mfJL7pQFt65qwGNwNoivstx78zq4NY31Zt8jQ1oQp
         vAbFwxhSLOzckS7mbsmEN97n0RglxjkKxzh44Um00snaATBDz8SfhY0kqKF8F3+komq+
         +SEA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Mp1pLScY;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.249.75 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-language:accept-language
         :message-id:date:thread-index:thread-topic:subject:cc:to:from:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pYXjqaYqFstpTqCEsQDTxw8PsfJNKGHFx8w7Ze3WmZE=;
        b=GAjz7qV+9675R23ulUCFAdu0GdmRE0BU7JwEd5JfSKIWJGw3UOibiJNFfWHzmjuiP3
         62QJTr3GgYjiaW/figXrCjhBXN6XdGPTIurxxealOrL5RVBuhSEcoFxMjCkG7vgxsoVW
         2aVCw1HMxLbo1oN+58OZ8bS0dDxxAiliuDzjH1KnxKDY6zEMVMjjnbKxsbHGXM+Weq+x
         0QAKPxL8Hsokw2HW08A3AKXHuLBhFOg1REpd4FCQXjUP5k9iQQAvARp1hhr8qMIVqPrd
         sSORfgNE37SeCZ/tttarSh9yKEbKzjtok1OzyvDtrKgVWyMRk34ns8bRvM8vVytifATa
         MoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:x-gm-message-state:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pYXjqaYqFstpTqCEsQDTxw8PsfJNKGHFx8w7Ze3WmZE=;
        b=F+SDuhFGrYj2U8iPeD+evXm4T5MDCuTHfZe5pgU7A+rCexLGZe2+juHAwZMULwuKuI
         ZkU56P7F76myIs9JQ7NNkRwIqq6jIervfnZ7EwwjGTlf8hsHnz/xxncQyj4hDVwkSsXs
         e99fnO6JUg8m5v+hPk+xaiU4A9GRt1ga4u2J86+vZqEIox1HqkxulU2ZEPHVDEca+AkB
         FHkOcjKmWdELRTYfgpHDfI2xq/dLEeNMbuBL+PoKmRitp8XBSwr82hA1jOS1ezZFN3SW
         0X+i5PO0nTcfPzxlbaWT2Q0PcNlSKIewl4oPIqSKiEBjxWwns3lQy2T9eXBbVCINEysd
         i6Hg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5plyPLBjQTQxUyF7x2Hy+J3oQC7+ilBMeYIE+FLvw6tGP1DOGRXi
	ObfMLq7fy0RgqhnYNuHKcPE=
X-Google-Smtp-Source: AA0mqf6Kle0d+67mSrtjRrstdLA0CCs8CKbIEbHcEQENk/gg+yuuO2LItZg0df5NokDWTsBatYlvSw==
X-Received: by 2002:a2e:a372:0:b0:26d:e73c:e018 with SMTP id i18-20020a2ea372000000b0026de73ce018mr5758975ljn.391.1669013231954;
        Sun, 20 Nov 2022 22:47:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:214f:b0:4a2:3951:eac8 with SMTP id
 s15-20020a056512214f00b004a23951eac8ls92365lfr.0.-pod-prod-gmail; Sun, 20 Nov
 2022 22:47:09 -0800 (PST)
X-Received: by 2002:a05:6512:310f:b0:4a9:d072:f5cd with SMTP id n15-20020a056512310f00b004a9d072f5cdmr746862lfb.119.1669013229900;
        Sun, 20 Nov 2022 22:47:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1669013229; cv=pass;
        d=google.com; s=arc-20160816;
        b=UbrQLKEfLwafqRYXcYW2FAsrn85CQjjaISlCwcU8wRa99Se0uEVbvkvFhcH+bqX/63
         X1/ESJQSrMlq/0Rxkmrf6S9KzijmAzmVRkreI9AgeOHHZDGSonLBWbhMTvkEJZbkUdTq
         f0OvEUSLDo9P+EGyW0kmIDQn+X7jhO5AGTx5YIIJFaHMhdnPPasAXBQAtK/jZqeQBqGC
         XhUUvdkwfNW7zP9sim4D03d1ckv3ExgO+uxdZsnsStvi6OTuy/wy9GutCS1vZ9mCaxy3
         QNMAnpJYUq8jkQ7dqJPbALWTf3QnMjs0LR6I3GoSxDbbiiL3Oz6wLvhbRNPDxW8yjYT5
         koqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:dkim-signature;
        bh=1QFruP8SX2xEqfZysQOrBve4GiTFDKLuuAP1BRapmFA=;
        b=uzTwYlR9OZnGedFj21EdPiLBlumObgf+4+63Zc82fa6jkCxSSeN7Gg8+DOrQXSy+8R
         SA5SYFHfBhgbX3xzUcOzukewvvW9GyQ9Eq8Ndn9t4wZJ858GIweRRdVMRbx7+SwsFFV0
         b+KOI/yY+lGMcY35n+wttI8aSQhENm+BykWB7cFrqtAVLYbO+QMmscbIVmXNfPhTusDI
         9z0/s6bYsQ6rFufLL6m9ZeR5Qn2415Z6Dd3IC7LrnPN8G/z26w/f/WJlg36fg2LeKHXE
         qig9Q4t1qBfp3JrvVek7vWgiWBWmjOMT2SY90moKngcRsYBvSus0fs9wTNAwR+cK1sSt
         9ByQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Mp1pLScY;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.249.75 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2075.outbound.protection.outlook.com. [40.107.249.75])
        by gmr-mx.google.com with ESMTPS id s4-20020a056512202400b004b49cc7bf6asi378006lfs.9.2022.11.20.22.47.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Nov 2022 22:47:09 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.249.75 as permitted sender) client-ip=40.107.249.75;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lW413sdGnS3ds8UILsMYL0ZIjoOvn61L2qXPDMaWG9kWgCmjEFqWug7OZe2WDHt1isT3Xyxu4O4vhFYWpMlwnr7W9ou0VfIgDeT/q4J6Qst4DZWT86rZYAPg0trtdb9iDe45voFWIIrbj4Due7EX0lqCSIht7Gm85ttmD3jP885F7KOL3vxMvZjHccmEmTeFlTa/3YWYgIz+Sk+AB1LvgZ404xOZsJlHa2a6kPjact26DnSnUNNWDJ8mb4BBQI3qfad2tM+AeIploO1cLkGaF/5TDAe0GWZOuEiaa6FUTYH/25vv1MjkrhK2GXiL2Na23tnKIWDNhRjjXuGw1nc1aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QFruP8SX2xEqfZysQOrBve4GiTFDKLuuAP1BRapmFA=;
 b=V6UIgv9XMbm0JShtRha8JnPbkE2odz85R5mtNw7TnpErhpewmxmEuTEK6u+0wi1YKVXmrTY0se+Hb+RKGQRoy3Vhtax3GhrcPWlYHMdyn3jxnXIj8bntzVHKIOGN5DvGxiXK+qOiw/0/ThdaDq+RRgMLJEQft0WeumkHI4aGwBIKM/dfvxITOhpExkNmZGVSpq02iTedByDTtMHtbBH3T6HiGAPLTmartLRTBKMxtbkKzg9u3qHFY3CBTLagd7G5fX7GjUBs+krZ+o5wgXvbQAUEdHAlmMXhqmZMlEdqi1TJ4iEXv7MgCiZCCiQrILg/DVcxRWD55kLBc8Dxxuq6fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM7PR04MB7096.eurprd04.prod.outlook.com (2603:10a6:20b:113::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 06:47:08 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::e33c:46f9:ef88:8973]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::e33c:46f9:ef88:8973%4]) with mapi id 15.20.5834.009; Mon, 21 Nov 2022
 06:47:08 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Question: ivshmem-net
Thread-Topic: Question: ivshmem-net
Thread-Index: Adj9dF+cz8Ds4ZUVRBa4XAFgTKsKHQ==
Date: Mon, 21 Nov 2022 06:47:08 +0000
Message-ID: <DU0PR04MB9417606E9DA7F4D450E98990880A9@DU0PR04MB9417.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AM7PR04MB7096:EE_
x-ms-office365-filtering-correlation-id: cca59090-7ed8-4a8f-2056-08dacb8c35ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q+f4TMcYqPiIK0HtiMS3/Zxtp89yehgz096LNTMhKwh3cj6APkPihY2IZUMd5OaAkj9QI/Irr8ldaDsATOT9uoDM4Whix6GoVhXyeetDzaMH6GcDrb+P3PYdmFepHe6YK11TCo0PNlfK/m/ICKgPJxI2re2Xw17qfkl5hAxOmNQAvx4qws4AW3F09RTgjjOhf9xGsRoqOdI3KiSmedD+tqjWjtPE1pflf4Ob1oiYV7UqHhCpdoIhpAnzNp+UhP+MbZPpoqJGfWqFckdvH12LJL92+JoFb76ZpbeNNjHuvewascI7p0l8rjDTyjbD8UTNffwG0gPhbL8w7sRyxWHeESfg97ziUTrDsKKW15szV0n2QJhEoTuCeMdJd6UhXMfqAQSGCpySPwS8hxl0W15/V4LYRrit5hp9sy/uZeZ/3rVUd1fdibXhKnAUtMzYF+1x8EyqCwzXENlJr9Wxyf+xl1TJEZuZ0Pwc7GlrYAR/lwG1RylhLqRJtgpRT2PEK2bcR4YCjLGpf59y9r6YuvN0z+UMdU/fFhEOSt1+imc78XJIUoH/GguFnPMbd+1WDUSVVWIUfA2n+rpGH2EDBNnNT4+GQD8Ut4ZYv8pRew+/TVxqOuQQ9roVyydKzsf8g9yTm7bfOezElmA98ZPyJ6fB6urqcrsOertSK+EOcRTMOR82GQt/88lyDt2XnBC2H+NnlzXAvg3WHyzBJoJmjhOHf+wmO+AWVqkTpbYEsnZ+ocM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199015)(86362001)(33656002)(55016003)(76116006)(41300700001)(66946007)(64756008)(66476007)(66446008)(66556008)(71200400001)(8676002)(44832011)(5660300002)(186003)(52536014)(478600001)(8936002)(26005)(316002)(966005)(9686003)(6506007)(6916009)(7696005)(38070700005)(4326008)(83380400001)(38100700002)(122000001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kWDHapYPntcqwVx6RtKBvfRFdNliQCTrwz7CuOCwH1Q0D2IBpsZoZkYmV3PE?=
 =?us-ascii?Q?OEX3No1iWXYTMl8RzBBhVFZiV1YgSS+m0xPs1/PJVDV8fGV1r8ncv+IUjhTT?=
 =?us-ascii?Q?Mv8aZarL6yHL3EBg3dj8KB+hPhjVKOxYS+rL3Vg6YptNJuHEqd3jb+ZafNad?=
 =?us-ascii?Q?J9d5coZTeKGQkbj4/57YTzs4OffTnBIoxw9OblLHEr8K/Xi73qi9Qxidt7Ls?=
 =?us-ascii?Q?pGCOzhqRaZhs7Wvsy2bsa1D1XFvmkHxlekBNMZA/m2ZY273SdZ1JBQhOujau?=
 =?us-ascii?Q?RwafPjcumXpSyphEPTJlpEyanM86hExqTwRBhFGznDFb33s0AB8SzKHM/4Av?=
 =?us-ascii?Q?xEByU1d6rS85WABqkPPsGMSxnp7XSCtiTkWO2gPcs01fbaH8ov7ZavLUPv4U?=
 =?us-ascii?Q?MHbnN/pHPigMD92uLISXCEk0OKXkMYEi83EtZfVf7/cDXrUYC/GINeaPOnkK?=
 =?us-ascii?Q?LwawAVxVf2LwD9ez6YDplvNfr15XksioD9NnaD49Ftm/RMBFlByxYfnpmuR5?=
 =?us-ascii?Q?WoY92qZdhuzriGty0Z3DqBDeFptc49lPqnyZYYQG6WLAG5SIJRGQdQJzS4Z0?=
 =?us-ascii?Q?6KnxoP5lcXpOOGdpE1la+btcoERzEnMJXGsnQMEbOcZoZIl4srbJ3BslPrJn?=
 =?us-ascii?Q?2M1ugUcKXscQ4bBzpGzqqDxL89qLzMI+7zlj+hmxzgd7zlvU6iOPKDO4SCcl?=
 =?us-ascii?Q?d1YD+0RkWnw+wfGOskTU+0FhPoh5Un+HupmJAO0voXUAmHPj9mM2HjaOz4bx?=
 =?us-ascii?Q?L4Vfy8b+jOQgQJCKZZi3uEOxgYlLhIRzeHkgl8Bfz7RCtBZ3c6www7UsoJtd?=
 =?us-ascii?Q?Y5NE7oXnrSTlkPT2GJJ4kPQ3Anrg9sa3CWLLxTugmY9UF2F5GeOAKdh84we6?=
 =?us-ascii?Q?VqxUykti8r+ZHWXqdClvH+Ra9ZyCsVCVOPeIgH3xnSrkNlv+fsfzBowT2upQ?=
 =?us-ascii?Q?KscN3dbhKI3GoikMh3q/5qW0Y1F8xhtMyjqbqFFKHVtN0j/jFFJTd70K+BJ0?=
 =?us-ascii?Q?Rt0URDAD5GZbUZoD09ZnxxPRS70DiETlZ4HnbZBhypBuAdyWoaG2gsAiNfJA?=
 =?us-ascii?Q?HXrCH6bWCTytNIQLjWtySgzbPlfWLI04w+aZwZNZnh1fANLCRa9324qJTbC6?=
 =?us-ascii?Q?yF9y3lGcXLtq+/x4dhtOpeKNvmGTFSRvI6KJBge7HTG2/Qg/40mIUxA0we/Q?=
 =?us-ascii?Q?uwcPe11ZMB46Oeo9nTxIvbqINAL2ue0Enxo6rni51ODHrLCAOpJMxmfZMzPi?=
 =?us-ascii?Q?Urf2CZbT89TZ/wxVFj2hu6R/4u+ciTL1eM+OVE9/OH8LLpyfham/bktMnBQw?=
 =?us-ascii?Q?Z/mlmH25+Rs+oAzm1nHAwqHPhVjYADvn4pEwNbLkv+z+ccO+yHCaSscV3pAw?=
 =?us-ascii?Q?9R4UYDSMzFArmBZtD3Jqd5lw9KhFCYxWdiDFm3GlP2LUA+4t5m62t/9kW00u?=
 =?us-ascii?Q?IGGku87wo1EZnzmZOr8U+Yy+dttil/+OVqts74Yqkm5uyParocBxFsb3RZss?=
 =?us-ascii?Q?1wK0e8gM0hMm4p2maomgwnfLVttLO5Og5t5hhNkxYdzO02IzWsh5simAFbZd?=
 =?us-ascii?Q?eHs3VomqZFRWteQILTg=3D?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cca59090-7ed8-4a8f-2056-08dacb8c35ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 06:47:08.2458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n1l1ADAgI8JOuVAapcYUPNMYuFb4zKCFSFcBlS4M99tIeotGYci+pXhaSEp5MokjGd8Osp3mh++2Y2snnmvM8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7096
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=Mp1pLScY;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.249.75 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Hi,

I have a question regarding ivshmem-net, not sure whether we need to use local_bh_disable/enable to guard napi_schedule.

See below patch:
https://patches.linaro.org/project/linux-usb/patch/877dk162mo.ffs@nanos.tec.linutronix.de/
"
The driver invokes napi_schedule() in several places from task
context. napi_schedule() raises the NET_RX softirq bit and relies on the
calling context to ensure that the softirq is handled. That's usually on
return from interrupt or on the outermost local_bh_enable().

But that's not the case here which causes the soft interrupt handling to be
delayed to the next interrupt or local_bh_enable(). If the task in which
context this is invoked is the last runnable task on a CPU and the CPU goes
idle before an interrupt arrives or a local_bh_disable/enable() pair
handles the pending soft interrupt then the NOHZ idle code emits the
following warning.

  NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #08!!!

Prevent this by wrapping the napi_schedule() invocation from task context
into a local_bh_disable/enable() pair.
"
https://lore.kernel.org/all/87y28b9nyn.ffs@tglx/t/

I draft one:
diff --git a/drivers/net/ivshmem-net.c b/drivers/net/ivshmem-net.c
index 3bcd39b91176e..81e19d80bd0a7 100644
--- a/drivers/net/ivshmem-net.c
+++ b/drivers/net/ivshmem-net.c
@@ -558,7 +558,9 @@ static void ivshm_net_run(struct net_device *ndev)

        netif_start_queue(ndev);
        napi_enable(&in->napi);
+       local_bh_disable();
        napi_schedule(&in->napi);
+       local_bh_enable();
        ivshm_net_set_state(in, IVSHM_NET_STATE_RUN);
 }

There are other places calling napi_schedule, but seems no need local_bh_disable/enable to protect.

Not sure the upper change is valid or not, please help check.

Thanks,
Peng.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DU0PR04MB9417606E9DA7F4D450E98990880A9%40DU0PR04MB9417.eurprd04.prod.outlook.com.
