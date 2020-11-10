Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBE6BVH6QKGQELXWCB6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C792AD2B2
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Nov 2020 10:42:43 +0100 (CET)
Received: by mail-wm1-x33a.google.com with SMTP id 14sf538930wmg.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Nov 2020 01:42:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1605001363; cv=pass;
        d=google.com; s=arc-20160816;
        b=QRVnHQOiMmAjUIntdPvS5+qlo+JCeVRxEPe2zjGhsaxSVXPwHAi0gdH8O0M3AwGT+U
         G9a9ryDpOgKd55HY0S+ZPp4OAgzmnVwMVU/GfPRbeS9Kfc1HcSF8MzbFc1ehi37hnP3r
         a2lUJfh7P8yFe8dSfC/BERMpLBuP69E0qQRE04S2fIf+XE8v4uFf1+fg4CUX0vwUs7TA
         GnfvdamkAfpDRHP/UQEsGUbLU7sLg+8WqazQY1b8D/Vq+ayrq9FUW30p0ruly81vET/H
         bYdjxBmMbX56PlGGBxBh0Xm7jcPuXg0p54cVVH4Trhn+X8ijgfhcNcwbp8kctnzUbPiZ
         jQHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=KCD+6anjAHQ1xR7Tq4d1J1YhyeFogoCQRfvP+IIvBtE=;
        b=UMzt9i4W2Zd7yTS7T0T09SFmskMnibz42wfoPQ5AT2os3OC6NUSuMvN5Lxqd2BN+dn
         oRtKV5rsrU8yfXRunykF/Yvwbmx9Pmom7IjgtPgkUZQSwPSxuR2QvilTx0LQJLdshM1c
         +im0kay2rKLGp6fnhdrtol3i8Am5djCYxJ8tELdeUP7KzWPbgaAPD49clpWdn0GiN1ej
         RaugjfW4dc9Vm0R2qlEeBnIK6255ZKLpPA6fvK0khyA0aM15ktHynazV5bpmuTnii7DG
         UF8On3wihWFb0qWknzL3rH23yrAgzQBCr0XSENYCPGJPL0De2ygFowk5d9tYXd00nmaL
         JfmQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KCD+6anjAHQ1xR7Tq4d1J1YhyeFogoCQRfvP+IIvBtE=;
        b=gYFZNfqaaxxcAM+OD3qJucSeG0HStSQox0Fvrw2J9Y2pNBOn9Ja1LNMhQOH7904tOn
         0LClQYyejjkcQNyh/AXNUpDOWjpLNzBibVzSSTWBGAM461plh2VVxpszOjbJMhIQUvNR
         JtOyIvGQzCdPtxBVCdmHrRBbF9+eJIe4Ug+lV+upG0nadDXnPLS3ysz/qMbrteh9nSgf
         rboy15J6WAO1lZqKOVZ6fewfLrUd9RgDOk3UNW9x2AVZiQ8ocaI7qlqiZukdPVApSrEJ
         2WPj8mGDooH6GEUA40XpRfdRZj+vcgXBWauA/YEowvpp23nyHKcDzkWcnUWK8V2q/Bli
         cO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KCD+6anjAHQ1xR7Tq4d1J1YhyeFogoCQRfvP+IIvBtE=;
        b=ug8Wx+TwxdETMNwhqQLGRkz66Bx6PPcrDFNCruqMyrBoQ5ertyJIPQ8dCMtM7uNJlh
         wuL7h49xkO6bSoFVsKbSlpaiOyoHRYaKSo1j5/990e+73v3Rl46uWGFH+/EdCCOUmw/E
         OXsRwJytg0Qp1WPMy82cZvYScmlkosYfKexPNCphAzMG+RIb6N5e6Dsfmc6dxMpCc+cW
         NX0dkO3zisg1W+IRbsbYuvIwnoomk8NeRJ0ufHNnLTSd8tEJfbkj6slCke6oJAQY0hJi
         dxg4dXEGBoKwZBGdQHxt0NinXP/t2c0OUJlXDYy5IbKCCBqB2svikbILr4kCqVNsei6Z
         BuZQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532CxztDdm0/v8+bcErSa61QVTTJTgeUn16mMd8nu7EAtp8HSZM4
	DL2sz+lTM9toGPLOfnNQuRs=
X-Google-Smtp-Source: ABdhPJxqtfqSIpyuQlGVJHM8ifKwTy/2RsjycF4pSXmGnr5V6p/rXSmbV9KUvZtgQqyBPHHNyaSQyw==
X-Received: by 2002:a5d:4a0a:: with SMTP id m10mr7820094wrq.16.1605001363563;
        Tue, 10 Nov 2020 01:42:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:5417:: with SMTP id i23ls890298wmb.2.canary-gmail; Tue,
 10 Nov 2020 01:42:42 -0800 (PST)
X-Received: by 2002:a1c:7dd0:: with SMTP id y199mr3930598wmc.95.1605001362427;
        Tue, 10 Nov 2020 01:42:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605001362; cv=none;
        d=google.com; s=arc-20160816;
        b=j/o/BLmoZT5q382XlzY+tpOYaIc8SOKF7AyVDYrBJspZKGQYN7TTrBZGXYud2pra3m
         N1dSDv+NtQTibouxgrbib9kmcg/ltvSx/tdGz7nEcj3jzAvea4uO9gUmwyMN/7q2nDqi
         5OWKsr8GbXQA5D8JXTvMMqS9I/rMoK99a/NK/vTbLQDs/H0UFMea04MtD0HvubEfWBvn
         qyrfOPGTR/zII8k+gqXNcxtCHaq2UGgNiWkijAVmnQp00jyY10FozwoADOBwFUiBbN+m
         C4Fb+FrZMep4tioy6TxTMztyYru99sllOm7+8lo85nwYqYC31cbrdHLz6Zy2e52qHOLL
         xOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=8RIc+SVvxf0JMkiMMtGGts753BtB2a0JyrwY7vO9wK0=;
        b=JhU9EpDa5n3I5tyzvjYIg7u7t0VHvcl9JlVUeAYp4IxEOL1w2A71BAHsZHnCE0IE5G
         0xiJ37gg+em4m+Fd8wGdiBzHeSlidbEhIO7cSSuRfYM5pJvClAkyNMS58KgHcIuwK5Hj
         F4bdXNkRSho6bwIuk+xDM/BRwUHsBlbLDKtZsU/mM7eR091yI0SKMu4kS9lTGh/ItaWK
         gZbyBCa5zh4rdcoo1CMvCNVmxIeI61Us4cUfAbqfo/r0UL3EjyaNR2hx6HaZbmrRZCyp
         f/ooCYpETxJN89iKQnjOxDY9Sgig0VgejkUFM/ptgIHy+1j1n2/UkcGE5tFskiUJIJQQ
         irZA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id c20si75094wmd.2.2020.11.10.01.42.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2020 01:42:42 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0AA9gfFQ031311
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Nov 2020 10:42:42 +0100
Received: from [167.87.33.169] ([167.87.33.169])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AA9gfom020866;
	Tue, 10 Nov 2020 10:42:41 +0100
Subject: Re: Jailhouse Hypervsior on Slack: New Account Details
To: jailhouse-dev@googlegroups.com, Peng Fan <peng.fan@nxp.com>
References: <01010175b1758008-a5c3cccf-f630-4771-9a1f-5ecdbeaa73b1-000000@us-west-2.amazonses.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ea6be253-519b-83d7-7d57-01563593712c@siemens.com>
Date: Tue, 10 Nov 2020 10:42:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <01010175b1758008-a5c3cccf-f630-4771-9a1f-5ecdbeaa73b1-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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


On 10.11.20 10:21, 'Slack' via Jailhouse wrote:
> Here are your account details, along with some tips to help you get
> started.
>=20
>=20
>   Welcome to Slack
>=20
> Ta-da! You=E2=80=99ve joined your first Slack workspace and we couldn=E2=
=80=99t be more
> delighted. Here are your account details, along with some tips to help
> you get started.
>=20
>=20
>         Workspace name: Jailhouse Hypervsior
>=20
> J
>=20
>=20
>       Jailhouse Hypervsior
>=20
>=20
>         jailhousehypervsior.slack.com
>=20
> Open Slack
> <https://jailhousehypervsior.slack.com/x-p1495803348528-1489807884627-148=
9873248707/messages/C01EKPMAJ3A>
>=20

...

Seems this happens when you click on the invitation shared on the ML.
Please avoid that.

Would be great to see a more OSS friendly solution, but it seems there
are no scalable offerings of Mattermost, e.g., for Open Source projects.

Also note that this channel has a typo...

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ea6be253-519b-83d7-7d57-01563593712c%40siemens.com.
