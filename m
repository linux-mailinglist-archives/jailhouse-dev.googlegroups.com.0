Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4EGVKJAMGQELGWPTAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC3F4F0F11
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Apr 2022 07:34:40 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id q6-20020a1cf306000000b0038c5726365asf4528194wmq.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 03 Apr 2022 22:34:40 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1649050480; cv=pass;
        d=google.com; s=arc-20160816;
        b=SDAmuWgCFNNHkYBUPCq1KS3VRWcYwb/6rLIzjUh5shYBwWngjXxNMGWwfgohHhQAVp
         f+gblMBknBEleqFZbwSSS6v4O6uhZqR5NUIoJ0ah/2ALKLOuvSeC5CrjCX063qIrtH58
         IiY6n23t5HgXBo3frcylP1NdbQT4XC4gEhMo2mxfkBP+7jN7zokalveQvx1WUAN63OoI
         Uvshbt+HVDxRZIwC6dIMjPUggF0Fa4kg1mWaMoQCZQ4oAN1kzifFXmtYQdrXk08xCsSp
         Ws94CM7zPz3mAVVCIrxcC0aa3CKse+ne+4NNs8CZZrIG7RXvwHTbthlpI9BfO82zzEE5
         EtAA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=XrUucwtq8ZOmVN8Ezr59gqfy1s9Y+AwNM2SClKJtzcM=;
        b=fGYZ6ECVt2OzsuE2AWoHFpV+BybrkGVgKa+Xyj+iD7GhHe3UZgNSJq8Ma5QDXaNQb3
         5HjFn5hynrP3RoX4xGMqMzvjpkcA+U54P3DSK5rVMkiO77oEuMb88GmAov6aBX1EV5Sz
         c7ZKsTTNl58VHXCjx5aqsbMhJidym0jzGDGLkG2HSSb4Afh8vfhykcJKIoP4KGobPUOF
         wzwOvMz+UPQxAV4//b+6JA0EJV9voSAE+LXVwLBarF1Tnvcgj8AaRX7JeLyxf9Yfp7/3
         y7KsGSatLjz39340kJ68G2cifUK1jcrOJmnwnQsLJowiUrq88iU3UvXiWi0hp1N688yE
         aX+A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=XH6emzbD;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe08::609 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XrUucwtq8ZOmVN8Ezr59gqfy1s9Y+AwNM2SClKJtzcM=;
        b=byKb93kRSJlr8hPQrGfy4Kvki2cnex9lZBlV/wAr+vnBB3u9X5zlbpmCsZHEZbf2A6
         REA6gDRA4GnkGst/jNwz5OXTdudrPN2FE5cg4QZXPshm0m/VeRN/kEoz7QVKRzz3SDE3
         GTnzj+o3Q87CurKiWF7Jr8VAypP5CA0vMGQ8MRoUbNocpchQ7HIwfo0eNfYKVm6etMoe
         bPlyeGOc9tswldD+wXGSHYr2fBxGOQNV09uw2hfpfDJAp2usHGgASorOMkQsMAY7B5vh
         U1aeKSROTD9KY2I01qWFZU+ZL4bx+WH3PQuXK0ycFwf6bGa56VvqVn8aC/Z6K4ojx5S6
         +xgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=XrUucwtq8ZOmVN8Ezr59gqfy1s9Y+AwNM2SClKJtzcM=;
        b=smnPVvYCdde9fvaJq7hCYL+wKDDu9jl7tEv3LIa1Qj2Kbf9tZvcxGCfo+MwD5Awy52
         wxeJMTQDYqQLBFK6O+gUXdaKmRvbFW8oXkUCP9IuSt0EpM5EHRSq44LxYLvZnwmP5WJc
         eELxC1dBtpeQBwm8PPgwVHSHy7P511rVJdw3HQ3BFUzITE3fatusoZukocUP2PayZUPp
         lgkfdqTGGjpoQCEXV16lRRTdmsToPoSUQRG8zclUZO5nSbDjoQzdTu/rVnBeLpCE42Fu
         oWub0lS6MyRm9UFGebq52zoCN81ttAJALCftb8u20GcJz+VtF5J44j7kSDhu5bW0Gdix
         ycuQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5310fasu2qMBdlflYBRajDe5r/Q91lOdovG1cpGsgtGoJi6jw+q6
	fil+dbN9QpJPC6Cl0DulOfY=
X-Google-Smtp-Source: ABdhPJyRKjXEBWWa2jhNEDLtb9lLgQR8MS8k8Zx7kitDey/Ksw20t5bh2dNtGyG7g0Hgk+sdi4s4vQ==
X-Received: by 2002:a05:600c:4f46:b0:38c:d4cd:ee31 with SMTP id m6-20020a05600c4f4600b0038cd4cdee31mr17800979wmq.16.1649050480631;
        Sun, 03 Apr 2022 22:34:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5306:0:b0:206:e61:ce02 with SMTP id e6-20020a5d5306000000b002060e61ce02ls165094wrv.2.gmail;
 Sun, 03 Apr 2022 22:34:39 -0700 (PDT)
X-Received: by 2002:adf:80c9:0:b0:206:db8:4b31 with SMTP id 67-20020adf80c9000000b002060db84b31mr3871429wrl.254.1649050479368;
        Sun, 03 Apr 2022 22:34:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1649050479; cv=pass;
        d=google.com; s=arc-20160816;
        b=E7Nzm5DQWymKl+OnhpqdVPMRUK0X+TBywglZ4MMBC0I7VxYPpFyQh2/yK32Bv8CrPW
         F3Vnnel7KhPV50e/BDn5RBKzW+Hzabjhds+Jwlqui6LAS19OGeuHS1hrWZ+Bq3sOM1lM
         mALlVYOb3XAEnUmBdz1Uxa24ecRtq2MBAQOTJWSRJAtbTlHiNIXT7MpbGpwX1rQfoGV2
         FrJ0bwV0UkSW4p/aEXOZcwYTlU7iWgFJwgtBZdn73ir4j6ciOCazhUHMiNZdALMOAp5L
         dPE4jz4oMx00tdkvnW5Z4M8AevQfBREeyMj5KLMxiKTfiJBvvk6JD5FgWrDRi1bV8LAx
         J6IA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YSCcjgn/yl7y7+38ukxCerRfORJ1OMLck0/Wf3Wl2SI=;
        b=a/f/tZBWxwmrqQEuAaSIhIN1gbxrXfuuMhHr+HCwLla20GjtkgYgxnWWNVnoVf1/QN
         EehNMeEaB9yKheynCZAuuCRYdIv2E6W6WiMtft6GMzE373ICHWUi5afiXwIggsvkbLkC
         Ha2O2Us/FFOmNqZap+uOfGCB4rzN2+ajSZp7Efdy+91AXf2OB2gEfd17rcSZXPXI8d0G
         tZM2Xl1pw/sJE1q4RSsv2zpvE07TJBZlbCJB4NYQq2zakYb+RQFnOEuEB1iw6hKGPCmt
         U8fpsWKe6wiruiZeDnzZT28dfhS2KsXfREeWG5ENy7L7Ee6RzfoB5h5tdeeBF0onxF14
         NZqg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=XH6emzbD;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe08::609 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-am5eur03on0609.outbound.protection.outlook.com. [2a01:111:f400:fe08::609])
        by gmr-mx.google.com with ESMTPS id r124-20020a1c4482000000b0038dbb60f155si245477wma.1.2022.04.03.22.34.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Apr 2022 22:34:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe08::609 as permitted sender) client-ip=2a01:111:f400:fe08::609;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTEohHVIHEO7kYwx7DfXblzSRQE7Urr48KKuF3NYh4Tt8gbTmYF6kFDf8XCUGK0kBfSPY+FjNSO/yM8mIVdRmcpdQPPtKO7ZXRZU5jY2zUih43B+JnLcZsxLmDFovr5bZ/ZIgZXZIft9jwZl2wR0dP+Id5o6wjZgZSLtzJy+eZTlHKy+eUQZpzDGSsCNqtQ+9FNLh90RjWYOcMDHbHPD2jJmBW6I8t1s4+bYKABl6qY08GG2s1B4LgxrPbLDrzesdSNTpb0IqZIxkSA0MjVuWKjMeocXxJ8jIIi/7Ze0NHzpxQ0DvtVLqEI3BXmeeat6H5cQkDToi5u8ceV0O8TLIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSCcjgn/yl7y7+38ukxCerRfORJ1OMLck0/Wf3Wl2SI=;
 b=esOi8zHTWER9ZZLinAs2fMtwVFjhQbZcGjRa5AGTrdFIKiFV+OIe3j2i0ciT5/gH0+bEgNxTAmKjcQivrZlfVTlFaUDwm5N+VT0msVNr42mJnC0p2F1dMybNzNNR//J18lkEZ1HXtCJn3xilf03RMNw0sbI0tukqU4IY9XXDQR0syU7vUxuXyH9tYrI/qpvDUvTJwX4if89LgytzRLwZVL73ti1NQXi7ZgkzKf8hZ8k5O1JBRfu5KDbw4hcoA2J7c5MonyD8cRN3F9gxRleMJb/s0++SibUVZdmtB9y9mMIOqF4k2PoTuBecfTpRt3XHzwRCngjlCho/SfZaWe2Jaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=ti.com smtp.mailfrom=siemens.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=siemens.com; dkim=none
 (message not signed); arc=none
Received: from DB3PR08CA0004.eurprd08.prod.outlook.com (2603:10a6:8::17) by
 AS8PR10MB4679.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:332::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 05:34:38 +0000
Received: from DB5EUR01FT007.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::83) by DB3PR08CA0004.outlook.office365.com
 (2603:10a6:8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31 via Frontend
 Transport; Mon, 4 Apr 2022 05:34:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 DB5EUR01FT007.mail.protection.outlook.com (10.152.4.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Mon, 4 Apr 2022 05:34:37 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 4 Apr 2022 07:34:37 +0200
Received: from [167.87.72.62] (167.87.72.62) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 4 Apr
 2022 07:34:37 +0200
Message-ID: <4b4ef662-3658-b277-847d-55aa0a8dd1d0@siemens.com>
Date: Mon, 4 Apr 2022 07:34:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4] configs: arm64: add emmc inmate configuration for
 k3-am654-idk
Content-Language: en-US
To: Matt Ranostay <mranostay@ti.com>, <jailhouse-dev@googlegroups.com>
References: <20220314152209.5859-1-mranostay@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20220314152209.5859-1-mranostay@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [167.87.72.62]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--18.630400-8.000000
X-TMASE-MatchedRID: irl7E//xM945QaOxwNGfvo9bHfxDWoib9c0SSBk6D8727WtDgGBc8lAs
	G9fXVGlJnhD4vcFcha5DnGb7aBw286Kpx4i76JWlz6XE9AJjaiuwomERj8iuDEtBpTx/ZEdypS+
	4boFpnzPfUZT83lbkEK6PKQSZCnDqquZNDw2pL4pY/tLUDKI8QCxppiUy9o4cD3uYMxd01bfPf/
	MnHE/ve4xRWJphhsrcxdmSBHvTmJNPJKNFvY5r+Zl9Vo28iC6JyL0+ZN5hNlt/OBWacv+iVSz0i
	buY6L9mYAwzRYoPhqwKVWBv5DfSi8wFSb+5tZB0vAcVJ5UuETrobNlOwAEO3GwTEruL9ObTkYC3
	rjkUXRKUAUfla+IhaLKXWmEvaG3ECxvAgaTHFy+Rk6XtYogiau9c69BWUTGwVnRXm1iHN1bEQdG
	7H66TyH4gKq42LRYkUGaixwmldBoVLi1Pb9b9c6nsYHGKOWe+Hq86ZlYipe1+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.630400-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 021805DA3A24F53BB90A01CFE81FF5265EC81CF7897831EA42B61763116123D52000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ced322c-ba51-4ff0-f9fd-08da15fccf52
X-MS-TrafficTypeDiagnostic: AS8PR10MB4679:EE_
X-Microsoft-Antispam-PRVS: <AS8PR10MB467929FA5CB8E82DFF7D2F0E95E59@AS8PR10MB4679.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QgTET8PyIQVmfqerxU1NAql/JfINGnQewbHXjgRfpE+7eHMR0gCHr0qUCXWMDqsnMC08zwFgL53LHNek8WWhLfsQd1MyjJAupFgbLsJq6eb16BLsTsz65eI7nqCySxObYSkKZS+SiVuqTBFF6YsliVD9/FArKYjwZm1tvusdjSz2o5lNsAhTO530SXd0BxZ/d6jgRXvi6tW3EvXt2OrJLgzhih+GSddmlpyKJjZ3b7wkRW/YHn3bL5boor/xkRUzFn/MJf/TTe/vrb4JkYqBCufKtwS+vDONuWIdLqZ4rWYwkk5ZPVeXp8y29iQwz4Rdy7u7FChQotagvAA90LoqFlHvEz9gj2vz4BGslWMTtqPGJe4Buj8bP9ZFoYHwlIiuLRyxr/6f1DJ8zG4Vo4e+mmC8tUobg1cZfXV5dedpQFXsr5rT6sHxNQELnUwSqVSoPdwoQic8hiNQ9NbVgYa4Hlh60UmgqtwLjQ5ZOSEvIr4VwKoj+ZqhGoTKLv7XfeaffyimJByhmKjqlB16t84zwWWwcu5MALhvN46S+Gn+nPpN7GcmKaw8+TnnfVvyRY2n6MiNfDnnHVsLB/yjPFtX/rM226hDzzaRvWSaeazckMn+snWw4rrxd3C8cetpX127rLTbZZz44oElGwh8iic6P74s3m/OSCxEMfJvowj7Vg5+5LCs4Hm9GhMVWhx33FimQbCPkKRWDgIhGz+2/eplVz9I03UHeAqwxGrnoRGpTb+TCi1k9mBvQx1MqQnrOg9P0zxOnAKz169VKDdjrV5kQg==
X-Forefront-Antispam-Report: CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(508600001)(2906002)(8676002)(70206006)(356005)(82310400004)(5660300002)(70586007)(36860700001)(53546011)(44832011)(47076005)(82960400001)(8936002)(186003)(316002)(16576012)(31686004)(26005)(6706004)(956004)(2616005)(110136005)(16526019)(336012)(81166007)(31696002)(40460700003)(86362001)(36756003)(83380400001)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 05:34:37.9985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ced322c-ba51-4ff0-f9fd-08da15fccf52
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT007.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB4679
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=XH6emzbD;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe08::609 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 14.03.22 16:22, 'Matt Ranostay' via Jailhouse wrote:
> Add eMMC support for k3-am654-idk in a linux inmate cell using
> CONFIG_AM654_INMATE_CELL_EMMC macro, and respective device tree
> changes.
> 
> Signed-off-by: Matt Ranostay <mranostay@ti.com>
> ---
> 
> Changes from v1:
> * Split out eMMC enablement to its own inmate configuration
> 
> Changes from v2:
> * Recombined eMMC enablement to one configuration that is enabled
>   with ENABLE_INMATE_CELL_EMMC define
> * Dropped patches that were already merged
> 
> Changes from v3:
> * Rename ENABLE_INMATE_CELL_EMMC to CONFIG_AM654_INMATE_CELL_EMMC
> 
>  .../arm64/dts/inmate-k3-am654-idk-emmc.dts    | 45 +++++++++++++++++++
>  configs/arm64/k3-am654-idk-linux-demo.c       | 22 ++++++++-
>  2 files changed, 66 insertions(+), 1 deletion(-)
>  create mode 100644 configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
> 
> diff --git a/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts b/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
> new file mode 100644
> index 00000000..150e31fe
> --- /dev/null
> +++ b/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
> @@ -0,0 +1,45 @@
> +/dts-v1/;
> +
> +#include "inmate-k3-am654-idk.dts"
> +
> +/ {
> +	sdhci0: mmc@4f80000 {
> +		compatible = "ti,am654-sdhci-5.1";
> +		reg = <0x0 0x4f80000 0x0 0x260>, <0x0 0x4f90000 0x0 0x134>;
> +		power-domains = <&k3_pds 47 1>;
> +		clocks = <&k3_clks 47 0>, <&k3_clks 47 1>;
> +		clock-names = "clk_ahb", "clk_xin";
> +		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
> +		mmc-ddr-1_8v;
> +		mmc-hs200-1_8v;
> +		ti,otap-del-sel-legacy = <0x0>;
> +		ti,otap-del-sel-mmc-hs = <0x0>;
> +		ti,otap-del-sel-sd-hs = <0x0>;
> +		ti,otap-del-sel-sdr12 = <0x0>;
> +		ti,otap-del-sel-sdr25 = <0x0>;
> +		ti,otap-del-sel-sdr50 = <0x8>;
> +		ti,otap-del-sel-sdr104 = <0x7>;
> +		ti,otap-del-sel-ddr50 = <0x5>;
> +		ti,otap-del-sel-ddr52 = <0x5>;
> +		ti,otap-del-sel-hs200 = <0x5>;
> +		ti,otap-del-sel-hs400 = <0x0>;
> +		ti,trm-icp = <0x8>;
> +		dma-coherent;
> +	};
> +};
> +
> +&mcu_uart0 {
> +	power-domains = <&k3_pds 149 1>;
> +};
> +
> +&k3_pds {
> +	#power-domain-cells = <2>;
> +};
> +
> +&sdhci0 {
> +	/* eMMC */
> +	non-removable;
> +	ti,driver-strength-ohm = <50>;
> +	bus-width = <8>;
> +	disable-wp;
> +};
> diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
> index fdf5fea8..3937dff3 100644
> --- a/configs/arm64/k3-am654-idk-linux-demo.c
> +++ b/configs/arm64/k3-am654-idk-linux-demo.c
> @@ -23,7 +23,7 @@
>  struct {
>  	struct jailhouse_cell_desc cell;
>  	__u64 cpus[1];
> -	struct jailhouse_memory mem_regions[17];
> +	struct jailhouse_memory mem_regions[19];
>  	struct jailhouse_irqchip irqchips[3];
>  	struct jailhouse_pci_device pci_devices[2];
>  } __attribute__((packed)) config = {
> @@ -112,6 +112,22 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_IO,
>  		},
> +#ifdef CONFIG_AM654_INMATE_CELL_EMMC
> +		/* sdhci0 */ {
> +			.phys_start = 0x4f80000,
> +			.virt_start = 0x4f80000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* sdhci0 */ {
> +			.phys_start = 0x4f90000,
> +			.virt_start = 0x4f90000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +#endif
>  		/* main sproxy target_data host_id=A53_3 */ {
>  			.phys_start = 0x3240f000,
>  			.virt_start = 0x3240f000,
> @@ -153,6 +169,10 @@ struct {
>  			.address = 0x01800000,
>  			.pin_base = 160,
>  			.pin_bitmap = {
> +#ifdef CONFIG_AM654_INMATE_CELL_EMMC
> +			/* sdhc */
> +			1 << (168 - 160) |
> +#endif
>  			/* vpci */
>  			1 << (189 - 160) |
>  			1 << (190 - 160),

Thanks, applied.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4b4ef662-3658-b277-847d-55aa0a8dd1d0%40siemens.com.
