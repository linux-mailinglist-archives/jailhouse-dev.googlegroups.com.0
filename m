Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZWHVH6QKGQETHKOVLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CF62AD2EE
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Nov 2020 10:56:55 +0100 (CET)
Received: by mail-wr1-x437.google.com with SMTP id e18sf5482209wrs.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Nov 2020 01:56:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1605002214; cv=pass;
        d=google.com; s=arc-20160816;
        b=wrjo8DMOEmzaU2r4BsAmhBV6q1vGArv5Aiu5zMrYWucCpDr8g4QiNJBMzfyJFfujKo
         4pA/rtMPISNy+1KHztcFuEN1oI/RzG+9JzkX6s84bmWENiUazgUZzAu6ZfoHqxepXZZx
         ND40XswxYe4WCFzMguQmBGi5Yiao/lUm7dhl//ILb8gklwzV6iIODAVdAqlUniEUF2vP
         ZAWNMJVCOweORhE8QoJUS5TzI4lvNkp3t2HR7WJhF1z0ho5xH7G0wDYlzdR5Szio5+M6
         DjGvSq9rdlPJN7lrdIWjbCNBLZKMZMJskEyLsBTBsUFyC0Oxsz6N2SgajPkEdBiZHlhD
         ipQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=ifTyn2kobQcfp7G1TInQvS+QRVLcRKZ17yGBYbkH2vQ=;
        b=g3rylawNi/GXEg+qfz3T1cdzuryluRIVLVCjyYITqU4TdYqyFBpK/62Ca7MqwBDTCu
         BK51C8UFmrsd6P7EWANh6QMol5ZMVHEkZy5UQANOq/29qmHCc2x6IzfCmLxAK3GezkEs
         utRYKcfYHYt/pr+moi7WRaAJOTfLhqoeOSpUmpv1yY0o+M6Q/y1o9cOWq+p6NqoZ3omt
         k/1GKPf/g6X02Mp0Av3dQ9JsDDYfpMfSPcNfNQkr6c9w4Ph2BkxRBd7Dscu5YkPH4MEZ
         5NqLVEYlCpGw4BxNyDeLZoco1t+hrI0/CDkLwc3MtXpT5GV0HXrUltNTIQgfqzFm2bLA
         ZhbQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ifTyn2kobQcfp7G1TInQvS+QRVLcRKZ17yGBYbkH2vQ=;
        b=Nam9gNHp0IufbXAZcBQsH0vxvFmQH3LUswmSBhN9b0HMPtX6ZsGx5mya7HGeRZrTOq
         snizBOS5lbk9Wu9JLNgWl9WWVDxQeXGeIZi7hIJvpjUCZmfnXhabf2CwdoslCG7FffUV
         x4xlGEcIs+mzs1yuf8BCQ7sKFmWwZeRmMwaCzfLl0m8F6ezDHz6vn4LberxtTj5LQXUN
         UT6TL0M0Z1y2cCbHJC9tT/l2Blllqp6A00yaj97JpCq2BrzyiFwWZYoKdEHi73YdZf6U
         ilVXvByEjG8NslO5TL1/JrW/AZfRievVonAdQb0TFLoAvSUturZnRRvPnT0MbFgdwc2i
         A8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ifTyn2kobQcfp7G1TInQvS+QRVLcRKZ17yGBYbkH2vQ=;
        b=ax22Zv3GLo4coP4vtwgnPhZb1Tq2vBckXlFl8/e7LeP5T1mTwdxXgnY8DUBUV0vjwt
         hSJS5cJ/zvYjwUoSO/HqFxj/EaJF4SOBZgdwMpfWeY1i8YZQP5iWa76RnhQu5dAzGvHa
         Yzqr6/2ui0oUDLgU84ugNB1w8QviiLqENTW7EojX3Wt7XcUn1d87T7rb1iWanBzi+l35
         kydF655rfGB9MIyLE0w8OfjNniTB2QifhkAxy2QuscuxaC/4stNHXwHqaJqSxqdGSCw/
         uuZP+t0tXi4WM5MNixffYL7hyJohHacqHhi3+bfBVzLhGnzpk+7DPbTUTf/nSd+iC49V
         Hziw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ZgnD0VQHvT90xhehZIOALe9M/gFUs5ZEEXqn5jQ9wie0ze+DI
	Ryzb5g3zFmijcYr7bJr1eak=
X-Google-Smtp-Source: ABdhPJzyw8Fz+r+3kYxrvyMb9tsAcASaf+gOQC/2xBrdHoZA0ovI7EMWhaKzguYvrq/Ob7MIJJOs+g==
X-Received: by 2002:a5d:51c2:: with SMTP id n2mr9377837wrv.326.1605002214860;
        Tue, 10 Nov 2020 01:56:54 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c354:: with SMTP id l20ls5827wmj.0.canary-gmail; Tue, 10
 Nov 2020 01:56:53 -0800 (PST)
X-Received: by 2002:a1c:6284:: with SMTP id w126mr3891194wmb.145.1605002213597;
        Tue, 10 Nov 2020 01:56:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605002213; cv=none;
        d=google.com; s=arc-20160816;
        b=Q5IzIFVlv9/0AoJlMaPWiqVL3pUBoR6E6anj0UfDuzETbQvIJ3kyxt1yiPly3eN9fV
         2byd2m9z15jiZsrwOgVW6cUp76xiL79Klq9n+2ahzd2UoOSM2w0xVBM75S2KPoXlYHHC
         ZTlWurEz6KNwgAnZXCaQI9p/NO2bcqeGDfrs0Ofd1SNs/dZLFXlGqH2OM5pzh05un1Qp
         XXDOtCO80eolfoNLdnNZ7wzGYhjbx9X9sXBOf9autfg8oMkEm6sydAsc11srUNDNudw1
         8FuUXjB3FpEgY0BnVR2eBwf2ppBl1qHnxCjnPbaCfuWppBqpKNAfc4BW5aD2nkfScQ+L
         TDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=WzpYJcXGue9FQpAPPMKAoVfNriXbHOpNMPRbPdYbZlM=;
        b=bfltETDjpMlb2qCRzPIoXKRvKDBz4FA3L7csMvEIzb+31mq+28RDGmy66ScU2xainp
         9Estn3hN3hkpc8CqRzdOKxvaJte8ZbYrim92yMPBNaPVxKOK3R/tEaLK6AKP95LqB+sd
         PGuRXAzvTyn+Ul2m7n8ehtHSRK7jmMzXj5KW83NWccmCmwpqBcmQhn+sjZjNPLtCVPxe
         0ZzE3ZY//IHMlTkf1ieDbiedAAzCUyNNR5Vu+mRkdiBnmGj2LjC7gHzrMvtAkbkWe9yu
         ohqzb0St39LFyYr4WdAKtRpgNWtCUWAecx4P4PKbiqjdOuWMT8MU1LEToRVXiwQjJt1f
         n5Uw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id m5si89219wmc.0.2020.11.10.01.56.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2020 01:56:53 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0AA9uqWV024822
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Nov 2020 10:56:53 +0100
Received: from [167.87.33.169] ([167.87.33.169])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AA9uqR1013835;
	Tue, 10 Nov 2020 10:56:52 +0100
Subject: Re: Jailhouse Hypervsior on Slack: New Account Details
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com, Peng Fan <peng.fan@nxp.com>
References: <01010175b1758008-a5c3cccf-f630-4771-9a1f-5ecdbeaa73b1-000000@us-west-2.amazonses.com>
 <ea6be253-519b-83d7-7d57-01563593712c@siemens.com>
Message-ID: <b1cc6338-a8d7-d324-af4a-f263eee31909@siemens.com>
Date: Tue, 10 Nov 2020 10:56:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <ea6be253-519b-83d7-7d57-01563593712c@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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


On 10.11.20 10:42, Jan Kiszka wrote:
>=20
> On 10.11.20 10:21, 'Slack' via Jailhouse wrote:
>> Here are your account details, along with some tips to help you get
>> started.
>>
>>
>>   Welcome to Slack
>>
>> Ta-da! You=E2=80=99ve joined your first Slack workspace and we couldn=E2=
=80=99t be more
>> delighted. Here are your account details, along with some tips to help
>> you get started.
>>
>>
>>         Workspace name: Jailhouse Hypervsior
>>
>> J
>>
>>
>>       Jailhouse Hypervsior
>>
>>
>>         jailhousehypervsior.slack.com
>>
>> Open Slack
>> <https://jailhousehypervsior.slack.com/x-p1495803348528-1489807884627-14=
89873248707/messages/C01EKPMAJ3A>
>>
>=20
> ...
>=20
> Seems this happens when you click on the invitation shared on the ML.
> Please avoid that.
>=20
> Would be great to see a more OSS friendly solution, but it seems there
> are no scalable offerings of Mattermost, e.g., for Open Source projects.
>=20
> Also note that this channel has a typo...
>=20

And I failed finding out how to join this with my account. Slack is not
particularly user friendly in this regard.

I think it's better to remind people of our existing IRC channel, one
that also provide a web UI [1].

Jan

[1] https://webchat.freenode.net/#jailhouse

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b1cc6338-a8d7-d324-af4a-f263eee31909%40siemens.com.
