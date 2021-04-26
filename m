Return-Path: <jailhouse-dev+bncBCZ3TK6ASEDBBKOYTKCAMGQEOQ7SNLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A97D36B2B1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Apr 2021 14:03:54 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id q17-20020a05651c0551b02900bdd1e782edsf14353776ljp.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Apr 2021 05:03:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619438634; cv=pass;
        d=google.com; s=arc-20160816;
        b=bdEMmV5ONoqMSsCPTIZP6N+cISarvO4pwwkaJGGBEqVsBzvrAR7GE+NwilDulElhOw
         WrP/cNzjiLR6eI3iV1vsyG2suMaZP4uhgQL7+ncAupaBrMm9VkJlsygA6g012454isgv
         iC7uzrAtUCxUfslZzhI22UEjnOBlgWsw62LQUouhhscXw9VkyFX557KFVKzm++ISUyI5
         lokt5Q9SYMKpKnZp8P/YEW5dSoV9bD0m9U/yE4QPbQLCT6QNLvRaQpRsY8ujPT39TqC+
         /gOg6NGGsb5M4kXD3IP6QA1q6BuVZjXJhME84rxE58/SPH23l7QwI1HZy3dX2IcFAqK4
         +CxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-disposition:mime-version
         :message-id:subject:to:from:date:sender:dkim-signature;
        bh=cu0jsfAJ81hWW5RgD+Y2jYkWMp/k4y22WZE8oSaW8LA=;
        b=y6azyoSae8U5X59Uw27+wLtmndWaKrv4nawrOwiPcmjryRHKm6TStdh8fxvREyfNmb
         J91VtmwncVSikXS4wnji11HWz5KRWVGGSKck43B5ZjWJeXiPiwVBAejorVDqBBseH+cK
         DP48ShV/ccWMCbiQTdsioQ13ZtQf01pfOK/W9YSow4A3qvXLN0ynpFLbckP3PtrTa3Ia
         aeunzyqsCSSzpvwIP3sCDCDNjsbLNfjAKzkDV/J8kSZp8T9a/zXeMo8GQNSdzTGRCNrk
         F9FXtldZ2eN0jOHCaTv487pWGkskcm8woB7rznvWAsubZw0dotZu0+CV+Ci1sfe0w9+a
         AB/w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of johann.pfefferl@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=johann.pfefferl@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:subject:message-id:mime-version
         :content-disposition:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cu0jsfAJ81hWW5RgD+Y2jYkWMp/k4y22WZE8oSaW8LA=;
        b=f2SSLCEL74dxFLdQErECXlUrpUF012+/CtM2aR8+SLcP9B29ujrL4uGVlmHvztDWxB
         uETS68rxM75xbFhFC7EpszUqXaaKn5jn60ri88jFU5YAoyQlSuHZrVJ3pqwHTHWrSRto
         3/uHrZqey13awM7/iPsj9rcPg96sXpZfmXHdXe7t9HgKFkMaEX3AcVRccanffIqzSjnJ
         WvgYr3sbJozs6WkwRxHrnV8SWi4OO7U5gSPZomg9bL9/FMebZ0xGxz8weFfADd8jqX0t
         PVTZ1oAtI1SUHeTFlnlaCaFI8+naTz1wpCssE/VrjyMqy85Vb46/8jKbeVLfhHU6ikOW
         keTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:subject:message-id
         :mime-version:content-disposition:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cu0jsfAJ81hWW5RgD+Y2jYkWMp/k4y22WZE8oSaW8LA=;
        b=W7eRvqH1zlpZnrfB8BbP+FqiXVjP2efuaFTLmHAWgQhUldel7TekkrOJ+y5ZycYYc+
         cd58JRhzqVFaUdEsIujCN2kKO2UVkfuf15gOHLvzyiBwAUcCyrp2E0RRFERUekscLkp7
         /ECLudpyTsfyTun4E7VHyqOctZC/l6dNChzXrkaJGK9YdOcl52U54mwhEkfUTDCAWkOn
         /qgqGV7ggPOVx/7ifHCi4rfrK0M0lBQorrSxBGfmHAHzsTBTRxIGwVL1VytS7ocYDmXm
         b6TfDG/iS25E5T7umE+75lqdlL47ozQDjzFb/vrXZCJHb9c2WPHO+sbRHblTn2l9lOs2
         3zzw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530mixt4e5RT7KJynia0imzxQBzPHbHWPmAlXYY7pUtlqzBeUNGR
	/f9PTWqF03LCDQlE0nPNxY8=
X-Google-Smtp-Source: ABdhPJzV/RBIRDR4xf1Ff1MsG+++04gzvxHXZ9kfHFK3Pqs/L5wwMKRgNI6br0LVzrlhr/ORqyxbfA==
X-Received: by 2002:a2e:9114:: with SMTP id m20mr13189071ljg.196.1619438634003;
        Mon, 26 Apr 2021 05:03:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5f9a:: with SMTP id r26ls99009lfe.2.gmail; Mon, 26 Apr
 2021 05:03:53 -0700 (PDT)
X-Received: by 2002:a19:4f5e:: with SMTP id a30mr12511134lfk.400.1619438632969;
        Mon, 26 Apr 2021 05:03:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619438632; cv=none;
        d=google.com; s=arc-20160816;
        b=zNgwUQNaZgHvdgSBvJ7S9TDE1dVxuJx5jrbLsFxmyBDNcGEEbcqkiFaH6dSfaxav4Y
         b7bU5T2wtE2dLEJ96C6DpIS6/po0HvaNRyTISjQJWBqKO6AeFa8opnpX4f6KN5VsrQxV
         A+e9Ykl170jF5O9mPf1/+lkAbg0VMJVbAwquvIAsJTI5YiASrnflVFklyCynTt2PdxrQ
         L+CYdyoDos/O0T1FjtAWXiYV2yRQcy3RCib3riDP2dd5u+7ba8acXOBW85M9+lNNyjXI
         VzVhV2bWvduON/7/WaKRkF6w51bV5tTxTdvPq0Z834PbeDhkODv8r2WRiKO8WP3CcEQt
         65vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:mime-version:message-id:subject:to:from:date;
        bh=6NvgNRBQupzW3IuFLkmBtldlsbiH4uyZSvxv8D9FR+Y=;
        b=yb5nv9IfEdAUJGm9vb3iUkYERIdSaXqzV93IHNoUlqRy4nZU4AVaHR0Ce0QGd2Nt4w
         cYPXeWQyBVpAJDGNPhFw0RUlX6FNzSI5eWqWYE9OEoUq6iyOpTN8kpwMyXWQv2Ox5tgx
         yaPEB8J1+MPnF64KuOnddnOYBGuBcZb7WFs1LYWiedxphmLr73/ObNghkFJmr6mFKBd1
         xEaeTzYEwxvy96Glyoq3VCcVScs5C5Ry32pJddmK9sVSZpleN/J246O5Lzs0OKumzERU
         A7LAEQnhspXOLrH4CAjcK9p3YTxpEOGy31EA5J946a9hYQ6FnHDPlgJznyIRiZLRTnSd
         FXUQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of johann.pfefferl@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=johann.pfefferl@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id b17si1084972lfo.9.2021.04.26.05.03.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Apr 2021 05:03:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of johann.pfefferl@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 13QC3qMG007324
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 26 Apr 2021 14:03:52 +0200
Received: from hpjp.jpnet ([167.87.34.51])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id 13QC3pWT006894
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <jailhouse-dev@googlegroups.com>; Mon, 26 Apr 2021 14:03:52 +0200
Received: by hpjp.jpnet (Postfix, from userid 1223)
	id AB5F7A02ABA; Mon, 26 Apr 2021 14:03:51 +0200 (CEST)
Date: Mon, 26 Apr 2021 14:03:51 +0200
From: "Dr. Johann Pfefferl" <johann.pfefferl@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: Bug in man page of jailhouse-enable
Message-ID: <YIasJ3qZXVF7vD13@hpjp.jpnet>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
X-Original-Sender: johann.pfefferl@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of johann.pfefferl@siemens.com designates 194.138.37.39
 as permitted sender) smtp.mailfrom=johann.pfefferl@siemens.com;
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

Hello,

the description in the man page of jailhouse-enable is worng.

Instead of

jailhouse cell create <sysconfig.c>

it should be written as

jailhouse config create <sysconfig.c>

Hans

-- 
Siemens AG
Corporate Technology
Research & Technology Center
T RDA IOT SES-DE
Room 33.413
Otto-Hahn-Ring 6
81739 Muenchen, Germany
mailto: johann.pfefferl@siemens.com
phone: +49 1520 3450 138
fax:   +49 89 636 33045
_____________________________________________________
SIEMENS AG: Chairman of the Supervisory Board: Jim Hagemann Snabe
Managing Board: Joe Kaeser, Chairman, President and Chief Executive Officer
Roland Busch, Klaus Helmrich, Cedrik Neike, Ralf P. Thomas
Registered offices: Berlin and Munich, Germany
Commercial registries: Berlin Charlottenburg, HRB 12300, Munich, HRB 6684
WEEE-Reg.-No. DE 23691322

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/YIasJ3qZXVF7vD13%40hpjp.jpnet.
