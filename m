Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLVSW6IQMGQEOIAE7KI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE524D750A
	for <lists+jailhouse-dev@lfdr.de>; Sun, 13 Mar 2022 12:44:47 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id p9-20020adf9589000000b001e333885ac1sf3902759wrp.10
        for <lists+jailhouse-dev@lfdr.de>; Sun, 13 Mar 2022 04:44:47 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1647171887; cv=pass;
        d=google.com; s=arc-20160816;
        b=QL05T4axBPTquIZ3pezT4Hs8R79TDToUZqElnEPZHFyVXlQH7Wi+J0pLZZacDYPAjV
         hwxNXInODBl4YQ/xcI6UoxYLs3izFwGc0cS7fQ8kubVtdertB51lVXGjpSHyTs1AiUn5
         joEIKqDcllvYpRASMSnQ6WcZHv4D4Izxj3KZP4nYr1qIMvWgm12VCtGVs/APjMTfkoTw
         RINN2Jx+pegcO8bXvVIHjfswSPvNNYtBg//aJrHeOtShrFNEiWpGg3Hdnph5zHynRh8M
         wIm8pnAemY75y6tsWsds3SDO1jHx/hSNA5ME7MTXlprTee9fKhE04HMTqnwfkRmKfrOt
         6o2g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=ZrsHk4aw48gVHS51of9bPub67eZzveVH92LzvPj+Eo0=;
        b=YH9csNIYyF21yrfvFnI05uZFC03FfDRY5Hhi6xE5aXeggS/kIFRGR6H+3dtJZHEIpj
         JgP4cwjN2ur2c/XV9bdPadnjtuS8DsBVwo/tLb0FgJ5QPX2jE5Lsr6qmHAXf4SME7lRD
         t7Z++WdpJSHpU9GKLHuaygA3HVefAew0XWKEgeM68FqAYsR+OzRj2WeL+QsPg4tzvi8b
         BHg3oohW2BS4YazbqGFgJVg43Ai49bxCM8IFQsej+d1MkppkzqtbUKO5nqJSgeG6UHRU
         nWq0G/xYnznj+AZWNFxwcxTtr+9pS0FMp7dZ9a3iyxwguKCCzmo6iVUgYsoCEMHT3JKf
         IkMQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=BOdjM823;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1b::618 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZrsHk4aw48gVHS51of9bPub67eZzveVH92LzvPj+Eo0=;
        b=MAdYdPiaNfm1oYATWB6FQzfbIoSlZI9MpdJnBwnrUbSBL6wC49PKDLZ9wTmwkCq052
         Kb+WEATl6v8t90irTw97mgTX4VrEvtao91G+bMB/QiVO8Hnx40qjZ0zgrIKZ3sklCmuI
         UhX/ZdWd1PKm/TEMcCJkgtmFRMqzQ2b/tKnHB3oGqYX7ePyWKh+0w1M7PbJ8N5/tsblO
         LXkhFGWSoXWm8JWrZhB/i40neZA1Zzf6a6dHVOvtPwVGgjVVNCz6gpGEKrbsrV0tm2WE
         XeQGw7nLKi7UlLhYtm+/Bg4LTpnrETEaKOj9SpE9AXEdZzhSUaNSMEZaruRYteUcb/4m
         B3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ZrsHk4aw48gVHS51of9bPub67eZzveVH92LzvPj+Eo0=;
        b=8QdCy/Tk1G+UKiiNN+dCjpprW5Z+RVuRX0gIMdgrPr95ZWkETJ40HbvvY2XvetELRo
         UMHDfq6BLvVVK6L1Io+/S9GWJEMOZODvHDd91a+7gRWmH2uDxdHcarWb7BZo6eEQe8zk
         zqYJQSFnyCHrWG9PjzCLkMf1jgablk96yhdqNa1b9RQsD2J5d5TLCPeDAErqaFbkZXgA
         ENxlT+cWDIEgNr6mjsFaC9gKDJgfPkyaqV+ZIDddCZUkykPfie75kzT5Y6sOC9sPI3vo
         orJS08VCHWLOON+J3OUAKBQHHxMpAXP1o3oKMYlB4Zt4dN2uit9lDmaX2cMr2UOZo/EJ
         4MDA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533KCJPo7WOvYKAhJHoc2bEcFGKJo+0Zj5AJnT4yE8hJIYijl6Gg
	47BUhJszQjCIALu3ZojLS7U=
X-Google-Smtp-Source: ABdhPJwZFgWo3odGZMmubodQ5oiQEYy8CGpl9/xcUD/0IgbgJULb2rXk3ipvle32p6iZwZaqw2kJrA==
X-Received: by 2002:a5d:43c2:0:b0:1f1:d99c:fafd with SMTP id v2-20020a5d43c2000000b001f1d99cfafdmr14130296wrr.282.1647171887121;
        Sun, 13 Mar 2022 04:44:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:584e:0:b0:203:8599:7254 with SMTP id i14-20020a5d584e000000b0020385997254ls55806wrf.0.gmail;
 Sun, 13 Mar 2022 04:44:45 -0700 (PDT)
X-Received: by 2002:adf:90e2:0:b0:1e3:f5a:553c with SMTP id i89-20020adf90e2000000b001e30f5a553cmr12909588wri.476.1647171885820;
        Sun, 13 Mar 2022 04:44:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1647171885; cv=pass;
        d=google.com; s=arc-20160816;
        b=Z8YUQ6eIJGwJ5s2oZs0hYNtqyDKEDK5zTeTb0KPW4pnUez808j+VALNXpzFqIhxaFR
         iUUDHokupSQ7zafCvw2Sl7HVPKYoDBc8X6q1+7nhW4pChnB3iGdf8bEsNs/pe8FUZSDS
         ApUNeCrF6TFBC0hsGrMw1E9LWMxQVGZ74crSCRdDAaOTNRGnnBYxU5VmsR91R5B3DDD4
         iKmaXCZo4fQGw3nFaTiAtTLk6Zjsj/gMOSBUdHd0b/ZShWBcP8cAfs8MY7JPLI0Uew/H
         QwlZZNXXuIbLd3glYT0aIDdUd2W/szn+k7kU5xJObRkik/rPdh8typc6kX1Cg2GpBoRx
         wCUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pWqFAUjAKhUEBbrk5OqVakqiWWwMmjxRFgfenGEntpw=;
        b=C8bOLahyrBXP42wswyF8je/XYaFp05IuFYPc6LgD7Vd7uL1sQMhUpZ58hlSF9egGyy
         OXtjHsIINRzepHsDJHoLiCwA0rr4VX2J1QPoq++6N4eqgAgZ5EUY2IXvbjoT2gxHcV3x
         QWAx91GedvHk/pnevVW/2fNBsu2UxDouT+05NcWw2gENfCbpolrZ4tjFk6dnSb0lknpH
         2zkv7+6TZ1GflvMOTS4PSBP6ssQBFcKXOowjRuPI9fKLfI+e16BmRE8aMV8lidWK01M1
         eb2pwaPa60rlXxbFwm+2wcK+32tyV0sS4GfcdSYrr0h6DCKX+VfylukLl2bV7I3T/Vx4
         nfSw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=BOdjM823;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1b::618 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20618.outbound.protection.outlook.com. [2a01:111:f400:7e1b::618])
        by gmr-mx.google.com with ESMTPS id v193-20020a1cacca000000b003816971af44si1063566wme.1.2022.03.13.04.44.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Mar 2022 04:44:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1b::618 as permitted sender) client-ip=2a01:111:f400:7e1b::618;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPMsm4irIdKfM5rSx+7JbNGGqR/DFZYvkMtv0UpEBO3A5UiuVY4h27IpZuDLlQf6qeIDr/ZJvtGxo5syl1+nMywjo+K9lJxoiterYZATMdKowHBF7sIVWaWs5hPicmhAkIeyIDIrBuL1be+tVSwSsl6cgAYWWjCgC5kHzHyfyAbZg2jB4F9pxranA/rDqgZjq5Sagh/iyx66GsuYGVtwkh1k3mxEqO9VvZODVSznBJfWISnC2UX+8PqdT7ui7+Agnoa0CkPmCcB6BT4UnY8WRTvsDSYxQUqKG8kDQiu8aXuJuGb93uUwtf+dwOYvpbvVibs4pvhpRlHwGSNwB2Cctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWqFAUjAKhUEBbrk5OqVakqiWWwMmjxRFgfenGEntpw=;
 b=fsSfxJO81O1oMmFeUtVkc/g8OeUmmlkBCjvbdKqK12cfG9Dfh6+nyfEZ0mu27hqsqb+IOETp2mIiNYiI/3Jjo9iiAZFw1aNkhjSYtGiz5LEU6xvHkiaBr7l+S4LLJTJnRy/9BK53gUHAIPbe0is6jYmdBFdPmamrGkA3f8Eq/Cy8bzUp/KyG+HvCt3Pinqlb3OlA3Mq8822jEgsrzq6Mdq4y1lEfPg0pi2xd57+ZrwLoK7OmSQbLC+bWZygAMs6H4kZmT6hXb8AUuUXpZ91GGmWc2MtewhVWMIeAp3SI7O6Xcalz19xOrzeG58SFAhuXdMyQ/HRIyYL54Ucw0xM4qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=linutronix.de smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from DB6PR1001CA0046.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::32)
 by DB9PR10MB4619.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:224::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Sun, 13 Mar
 2022 11:44:44 +0000
Received: from DB5EUR01FT049.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::4b) by DB6PR1001CA0046.outlook.office365.com
 (2603:10a6:4:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22 via Frontend
 Transport; Sun, 13 Mar 2022 11:44:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 DB5EUR01FT049.mail.protection.outlook.com (10.152.5.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Sun, 13 Mar 2022 11:44:44 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Sun, 13 Mar 2022 12:44:44 +0100
Received: from [167.87.32.18] (167.87.32.18) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 13 Mar
 2022 12:44:43 +0100
Message-ID: <bbccf6d7-479e-4e3d-7cf2-89d8687b9e16@siemens.com>
Date: Sun, 13 Mar 2022 12:44:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: Porting Jailhouse to the STM32MP157
Content-Language: en-US
To: Philip Molloy <philip@linutronix.de>, <jailhouse-dev@googlegroups.com>
References: <1f639549-e27a-e369-b60b-33e444cb0017@linutronix.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <1f639549-e27a-e369-b60b-33e444cb0017@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [167.87.32.18]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57dd6a4e-2fb7-42b7-a594-08da04e6de57
X-MS-TrafficTypeDiagnostic: DB9PR10MB4619:EE_
X-Microsoft-Antispam-PRVS: <DB9PR10MB4619307E3633B6F4AC145196950E9@DB9PR10MB4619.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DsW+g8nfsGJhwhkcRhtQoIPzsHgg5geIEkpXDRwAFM5YmVdr9kES4IbdcX6TM1qul5yy94FW13fQ3F9nM0r6KfgKhK41LLhjVUppJwUCjkEWCzxFUg7JoDiE6RnXNjPmomOvzx5NVNX9FQLmGQf/qZpMRKw0s6nY6WGQyHVVKDDqLIBb8GgA1GlgMttm7j5LiTB+GiRHKp7vQXW4LeTJgUt/L4kEICDu61e1kwTyPgduHQWPJQZaAdDTYEPWvH3fHxapm0IsBsRruo23A5i/1gAjdGcb6cBjvAYIxGctUIk9ufOC0KMk13w3N5EBSQzVum3Kd8rfFuAx5KXaWXry4PXhR1jNyBKA6gZv9vZ9NHARJFeQFDm0Iz/BMVuOyJbHjwgJZI+s8pu1nDi99ANnqnB3M8nKr1VVvEh62xfcCMJ0SHltF8e84pZCZTRsXfLKe/Cw8rwECVm0z/XtJu5Re+pdD9UsUcmpUhLixGWi2Th7H0IJi+b0d3y1ZpRO+esh9L0rIy9SQiF2VBM9hQLp4e8jHctu1ZKjjbraUyAaLTWsdSAAHNipEItXw5oppfRqf37zLhtOFCynIgmJIB1NH5QaVtp2GRzZP0hWoRZ09eV5nHlzxhyufHdNR+YdTJ3udKztkaoJ+r52g79pZVn2nD/eF/yOIALE3LMaiKuQSilwg2BbuJjq7R01VGC2tWvtPgtSE3O2+/d95M/MT7watLOHlJqnwbyji5YtYxoIjVI+Ed08ePgFLkhEdl0HeurnVRp2FQlt6Legs7bo0IexU6D8BxyTbigUbbF2osrvbVmFEwnzioVKV6IhGGmBP+zL5h4dQDz43lEnX3tHo6OoSUfb33cOA6jcwWnYgIY8pxGUD5BC/CQTkSWqH+qgoogr89c8DdgVsR/0/WIYUZtwLg==
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(86362001)(40460700003)(31696002)(508600001)(110136005)(966005)(36756003)(16576012)(316002)(6706004)(356005)(82960400001)(31686004)(81166007)(5660300002)(8936002)(47076005)(44832011)(53546011)(82310400004)(336012)(36860700001)(70586007)(70206006)(8676002)(26005)(83380400001)(186003)(16526019)(2616005)(956004)(2906002)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2022 11:44:44.4996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57dd6a4e-2fb7-42b7-a594-08da04e6de57
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT049.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB4619
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=BOdjM823;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:7e1b::618 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 09.03.22 10:54, Philip Molloy wrote:
> Good morning,
> 
> I'm porting Jailhouse to a board with a STM32MP157 and have a few random
> questions.
> 
> Are folks still using the #jailhouse channel on Freenode?[1] I joined
> briefly and didn't see anyone. It seems like most projects have moved to
> LiberaChat, but I didn't see anyone there either. I also checked OFTC.

I think the IRC channel was never very active. Moving to LiberaChat
would be appropriate now, but without an audience...?

> 
> It is a bit confusing what patches need to be applied to the kernel. I
> initially saw the patch embedded in the CI script, which I applied to my
> kernel, but then came across queues/jailhouse in git.kiszka.org and
> applied that instead.

queues/jailhouse is mainline tracking,
https://github.com/siemens/linux/commits/jailhouse-enabling/5.15 is
current "stable". You can also find branches for older LTS baselines there.

In addition, you can find two reference integrations for 32-bit arm in
https://github.com/siemens/jailhouse-images.

> 
> It might be nice to update to README to clarify what should be applied.
> And perhaps modify the CI so that it uses queues/jailhouse or tags based
> on it. I'd be happy to make those changes.

CI is using an older kernel to stress compat support. It only has to
build, not work, thus this shorter queue.

> 
> I believe one important difference between queues/jailhouse and the
> embedded patch is that queues/jailhouse doesn't seem to revert
> 15ff9a39cd5ebabdf704634ea58806f2d12bbc39. For more information on the
> impact see 6e43fb65 on my development branch.[2]
> 
> Feel free to take a look at my progress on Gitlab.[3] Note that I still
> have a bunch of TODOs littered around, but feedback is always welcome.
> 
> Also, if anyone from emtrion is active here, I noticed the emsBC-Argon
> also uses a STM32MP157 and I'd be happy collaborate.[4]
> 
> Best,
> Philip
> 
> [1]: https://github.com/siemens/jailhouse/blob/master/README.md?plain=1#L47
> [2]:
> https://gitlab.com/pamolloy/jailhouse/-/commit/6e43fb65b01a7a622cd6c2195a3bcf763bcf84f4
> [3]: https://gitlab.com/pamolloy/jailhouse/-/commits/stm32mp157
> [4]:
> https://www.emtrion.de/en/products/emsbc-argon-single-board-computer.html
> 

Looking forward to the patches!

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bbccf6d7-479e-4e3d-7cf2-89d8687b9e16%40siemens.com.
