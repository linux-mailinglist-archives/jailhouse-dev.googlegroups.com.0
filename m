Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAPAWGEQMGQECTV2WVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A873FB0D8
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Aug 2021 07:43:30 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id j33-20020a05600c48a100b002e879427915sf4279393wmp.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 29 Aug 2021 22:43:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630302210; cv=pass;
        d=google.com; s=arc-20160816;
        b=pDWa61leimf0v7q08oOqxaY0dE5au5lY0kO7SHt2RhmP7Z+f6wF4afAqRbcBl1hib2
         RooKc8GuFk53jSlbQjJe+nRb5/j+4g7BdPY/kmzbGCVD8ZDTzTxAy/5YQu9GP46REWQX
         PJaGELDUy80pbGJun6f0rT3CfuipnGH+IOfqf+Gb1vw81ONgZit6jIfS59uiN0ZR6tfw
         CQroQugX/ZZckZIseqKTcIVBmo+3ryxo7vEHEDgJTmhokUW0GQ+mpBmLnQLLIkvZijoQ
         GAcP1+LY/eWXril+vKle6+7Wm74IqWO0viIXvTAB3KAeHyO0KJ3UKoDmCAXc4jegz35y
         kY4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=cCUZ4c2VgUiWRCy+SHdiIlXASpwXTtnPBdfPm98Dqr0=;
        b=YttDHIc9JxgDLg9+bYmkQFs1c8Sl/4KpdCPmzJkUf1iweyu5yMq6918yB4RxldOdI1
         xiB9JzPFfTlZ6m6GjrjVkws1cGPgVq8VaaN34bqLC1WPIkGD7W+fjEzUd+hThz9P5kFM
         WxCQPi7SNkYJH4XqhPiEwT6kbwqTtxz6oBWrPiP4ydI/OjNGCzObW2C5IYyh9SXpJW8N
         mdFUAVLwrR1doFwluiPVRxXPkMMdmbNmW0I60y6dXATfacRrLwEuUb/ZHQOTGaeN7Pxi
         A3GiwHk8bvdjdESC+bX/E6W4ACUka6YOcIN0PzeGA6RWo+6TKK6CPke+nZKJspD/CWwy
         360Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cCUZ4c2VgUiWRCy+SHdiIlXASpwXTtnPBdfPm98Dqr0=;
        b=X7ruHNlSCMg1AI5uYX5ZYNu0bphjF4vP6v7Re3KJGN+cl1nNG+mACxqwo8GkX/PBQM
         oh7g/PyX9FXoejyTrHHUCgcV2QH0cJNsjtc54pPPPjazpUz7ts/izJ+UYLUF92gCU7D1
         IQf3XKR36rBeWRqGp9EptqtGZWJlV8a3NreSknSxFGqE3NWY7khofZLRh1ZDVYAAeAYY
         CSPJxIdtRbTDRyJMhbKNL0K8MKpoZjWjPFlfZllrK4Q3iipBMnTz4HzIjxvIwzMg4GvX
         f0HWr4ip7y+7BTX41THITgkimfLv4vRnv2UGeJzL89GOVE1JA0XmPpol/kIQTxNXjpfR
         pRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cCUZ4c2VgUiWRCy+SHdiIlXASpwXTtnPBdfPm98Dqr0=;
        b=gxd1EcBDiFCJoahMs/cwuikCbeQH/LhTRbCqBLWgFm7qeSU3WTc7mO5I/r10uNcM0Z
         HHaZr49AfyzsWu4B7ZM/h5xi3ja3XcNjxjCxSd1VWmy5sn3D/5GLAGANEhSfxoSJ+ChF
         DbY4BcIC7ukuoiuj0Nx/imNTktd4JsGsB6xGtGNi6As5m/WQTm4EiAuAXQCNHwXGhc+A
         dly5PLw0Ziv8voFl+hWOXJ+dPq4IjrAAxDtBnT4nHLBAeOn15NCNVsI4MGcT70xB20VN
         Glh9fnV/d9O0kqqxONA4XjdYPKTSo3Ax2EMga4T8VFw4xsDS6QPjzDSWqIVGvXypsIRx
         qdGw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531KfRJUEKPVmB361eW0L6TGDk5GuGhxwO3MVPi1b0J5utVjwdWu
	ONGFRRZN1DeL82GrJvj25fw=
X-Google-Smtp-Source: ABdhPJxv66/OCD+s8zJBnnfEKSFwUOdShArfDFLunS1rPrKFBP/zAL1oFBt+bF15mkaGigtFGsW+4Q==
X-Received: by 2002:a1c:c903:: with SMTP id f3mr13414983wmb.101.1630302210620;
        Sun, 29 Aug 2021 22:43:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1b0d:: with SMTP id b13ls53557wmb.1.experimental-gmail;
 Sun, 29 Aug 2021 22:43:29 -0700 (PDT)
X-Received: by 2002:a05:600c:3ba3:: with SMTP id n35mr8509562wms.166.1630302209013;
        Sun, 29 Aug 2021 22:43:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630302209; cv=none;
        d=google.com; s=arc-20160816;
        b=Khco156QFJzJdviMkEOPR3iwsii8XCc63KWDtsb4lD1Pas8Jg0a9tYoV37QJsX8npR
         5CDEPaUQAHJiicx1opoi06XmjJv5kxfXaXANEhFyJBN0kv5LbAproIHOtgo5IoM3sxMv
         2D66FR2k3DGFJrHV6U3cFH8aZlwa5dW6AU1FCdJlok8dyowOTGTyhyP9WnL3vYzwJaT6
         zeMwsSfAy6hkzOY84MYu+tMrZT0zadrXsBRi6u2051SJdHYJ/cHaQFN0hfjQ08TH1b0t
         hUOHZVbVrJgszQhQko5Xh0tYYe3fA7d9XR9friYBDwiHc//28qgh6EK+FeH/76u7xqvs
         rlUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=2HsydvabSXA56DTmANB/LqWHerUEsXvZlwJ4VTHw1s4=;
        b=JLVa+xbqi3zW50Hvri1jeJaNOAHvZjDIWLpoqMH6hodu7KLAmTvsgOTVBFkHBARGwN
         YbxwTFan78NEazgdenT5EOIdx1rI1AYOobVDMPviaCBeRZpb19ymmx34cfPVeBOi/oCs
         b1gGYmFc9UG6ceMb5FXfrENmEFdslF2ThKmwhSfPLz16w1Zu47pNKWm8/TZ1I0URzsDJ
         zpqG3vDlHBXANdrosIIjOeQzwWqUhY/e03qmO0vlH4pNXaTHva4dx1UNTTRiuI3uikVq
         +ex9V8RmfXvVH362ww6GA7r5sk1xcD7m9WinHGueqTuUC4gstdu12xsSK5STxfw0CoGz
         J1Eg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id g17si637931wmq.4.2021.08.29.22.43.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 29 Aug 2021 22:43:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 17U5hSLv026483
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Aug 2021 07:43:28 +0200
Received: from [167.87.2.75] ([167.87.2.75])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17U5hRdo028040;
	Mon, 30 Aug 2021 07:43:28 +0200
Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access address
 and size
To: "Z.Q. Hou" <zhiqiang.hou@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <20210827075116.6208-1-Zhiqiang.Hou@nxp.com>
 <2d3cfe41-3c51-34f8-8130-f6b86720d835@siemens.com>
 <HE1PR0402MB337191DE611BA6CC480C104D84CB9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <dd785b10-ac8d-f483-7483-f8830ed6147f@siemens.com>
Date: Mon, 30 Aug 2021 07:43:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <HE1PR0402MB337191DE611BA6CC480C104D84CB9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
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

On 30.08.21 05:02, Z.Q. Hou wrote:
> Hi Jan,
>=20
>> -----Original Message-----
>> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
>> Sent: 2021=E5=B9=B48=E6=9C=8827=E6=97=A5 15:53
>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>; jailhouse-dev@googlegroups.com
>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access addr=
ess and
>> size
>>
>> On 27.08.21 09:51, Zhiqiang Hou wrote:
>>> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>>>
>>> In function restrict_bitmask_access(), the current access_mask is
>>> implicitly assuming that it always access the whole register, but some
>>> registers are byte-accessible, the Guest may get/set wrong value when
>>> it issue a byte or halfword access to these registers.
>>
>> Can you be more specific in the affected scenarios? At least one example=
 would
>> be good.
>=20
> Let take GICD_IPRIORITYR as an example, which is a byte-accessible regist=
er.
> Thinking the SPI INTID 33 is assigned to an inmate cell, and Guest wants =
to set the priority of 33 by byte-accessing.=20
>=20
> Assuming:
> GICD_IPRIORITY8 original value: 0x00000000
> Guest set value: 0xa0
>=20
> Then the current logic like:
> The access_mask is calculated as 0xff00, GICD_IPRIORITY8 read back value =
is 0x00. Then 0x00 & ~(0xff00) get 0x00, 0x00 | (0xa0 & 0xff00) get 0x00, t=
hen finally 0x00 will be written back.
>=20
> With this fix, the access_mask will become (0xff00 >> 8) & 0xff =3D 0xff,=
 so finally the 0xa0 will be written back.
>=20

OK, indeed a good point. We missed the byte-accessability of
GICD_IPRIORITYR.

But this reveals more: We perform a read-modify-write cycle on behalf of
the cell with the cell's idea of access width. That is potentially unsafe.

Handling of GICD_ITARGETSR has to resolve the same issue, and it does
that by converting the request unconditionally into a word-access. I
think we should do the same here as well.

gic_handle_dist_access should provide a requested access_mask to
restrict_bitmask_access. That will be size and address derived for
GICD_IPRIORITYR and all-1s for the other registers. Then
restrict_bitmask_access would cut this down (rather than building it up)
based on the access rights of the cell. restrict_bitmask_access would
furthermore ignore any accesses that are not word-sized, thus
gic_handle_dist_access should convert the GICD_IPRIORITYR into a word
access, just like gicv2_handle_irq_target does.

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
jailhouse-dev/dd785b10-ac8d-f483-7483-f8830ed6147f%40siemens.com.
