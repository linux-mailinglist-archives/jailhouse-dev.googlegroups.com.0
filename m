Return-Path: <jailhouse-dev+bncBCAYF6GBVYFBBH6SVCYQMGQEKEIAF7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3a.google.com (mail-yb1-xb3a.google.com [IPv6:2607:f8b0:4864:20::b3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B018B1E95
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Apr 2024 11:57:53 +0200 (CEST)
Received: by mail-yb1-xb3a.google.com with SMTP id 3f1490d57ef6-dc6ceade361sf2150293276.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Apr 2024 02:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1714039072; x=1714643872; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1vwWv4ERp/COC2Bj4nZgZEhb7bsuk6veLcHvNML+AE=;
        b=oXu0rKU/H9Td1EhFkCzB4Fd2X1LIPLZ8vhjr85Zm3b7wpZ2oUFm8QOwytuXXa/r9dZ
         CNO8+IeQmfS1H0zyatDhIYZ1RH1qTEJcToj3LDQuRAEyQKQ3/M8K/nnUQiXCKvLBwLfV
         yeqSpf/hfAn7C4wHMwzZprZ29jKyqifCQm/+L+nJ+MTDLgnG2MnD6XpV74EuILyHI8JF
         F+IQP4WEN9ZB3K3TXxPCoE+21Eyx0O6GEDgIUy8sjeKRr/N7Mvpmqp5gKrEItFDfqbKi
         j40EIPnIufXpTc6ewDEXbYW1aVaDfhpPN7NLSFwRWdMUwVrlvPycS+rFZ6AzMELOxBG2
         B7gA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714039072; x=1714643872; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1vwWv4ERp/COC2Bj4nZgZEhb7bsuk6veLcHvNML+AE=;
        b=mVlutKYReZA/etSx5lxM2Kx2tC0btgR5bpAbVDnbF50LG2a6u9eayY5OQ+AtuZEG8x
         uESR38AnY7ugO2gwer9NSXGg+0kOlcBhkdCwP7CMwADD34nrYhShKbbTCR11v++6yWpR
         UJ7H8ZGkaoG0pEXyiS1ky/8fvnJTPCRNtBUY3aGanSkK/9kKk4D/G8MmoS4QanCSazsV
         fdqFl+q9+4iZJTr/P1MB2XIud9/26gaSDVJtxg69vOP5o16KZQxlty3m9NdV5xYrKUWN
         cHpI8GEBzKVxdJMYntFldm4zAcNhuoXebS9DaGGMaudY2fBvJsxtzM/CNrYzOKbRqdCr
         0A5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714039072; x=1714643872;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1vwWv4ERp/COC2Bj4nZgZEhb7bsuk6veLcHvNML+AE=;
        b=GLNHx3VfRFw77nxSV+omkYAkBhDAo6E8QAkh/6aR7mYQUU5A7/dYBh1VhOPcZc83JE
         vvu5R2DXYIYJFExRMrD49DYB/Ms3Dpjo3t6N0qCiF77bOhdPHNqSMWFVXwWDWoxPl6Kk
         kzMtmQWr8nhghNrMolzi56gaoY5mPTML7Z+ak3E4LJOZ3oKiU5FPjDxCWrmo/v2D6Myt
         UgTIFE+1ijqWAr9UmfQ1+JXtGDo8bFNXp2Op65XEuA1l/Wzz4bJ6K2Op5ENCo7CmtJ8O
         3dCQOaijC20W70+ktYAc2VyhpGKuwhZyHH4ZlfnJgr1TSyrnRkKRYTVVykn9GY5m61LP
         DKVg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCV0/O2K/afA8g/iVdYn+7iB6BrOIY8fiReNNds0U1i3mywgJGj6XhS3doK3uFOQ8LtoFoGJCIAvlMCi6oZACKPZDeNccnHGv+s2/Qo=
X-Gm-Message-State: AOJu0YxO+U4++fr8XHFEq2ImR6Kul/n0yT6Ardx3r3T6mI2U8RaCrhhG
	c1RMaoxQ9ndMcH/jmL8ZDGlDV7AfiEfnLdz/1jtlM/mZ8OwQ0wZo
X-Google-Smtp-Source: AGHT+IHCJp5zAq0NVN8wrEAsJwd26SQ8efB9ZQr1R7khTdKsrW3KfhqFXCim8jVh9CRog7lRcR6J0A==
X-Received: by 2002:a05:6902:20c6:b0:dc2:3f75:1f79 with SMTP id dj6-20020a05690220c600b00dc23f751f79mr6261730ybb.23.1714039071720;
        Thu, 25 Apr 2024 02:57:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:2748:0:b0:dcc:4b24:c0da with SMTP id 3f1490d57ef6-de586134826ls1160143276.2.-pod-prod-02-us;
 Thu, 25 Apr 2024 02:57:50 -0700 (PDT)
X-Received: by 2002:a81:a252:0:b0:61a:dcd0:5a61 with SMTP id z18-20020a81a252000000b0061adcd05a61mr1022152ywg.7.1714039070155;
        Thu, 25 Apr 2024 02:57:50 -0700 (PDT)
Date: Thu, 25 Apr 2024 02:57:49 -0700 (PDT)
From: Yulon Liao <lylguagn@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <04066d75-c4b6-4450-9986-47d2df5ad939n@googlegroups.com>
Subject: non-root cell cpu clock always 24M
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_13140_1543085474.1714039069331"
X-Original-Sender: lylguagn@gmail.com
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

------=_Part_13140_1543085474.1714039069331
Content-Type: multipart/alternative; 
	boundary="----=_Part_13141_1964302037.1714039069332"

------=_Part_13141_1964302037.1714039069332
Content-Type: text/plain; charset="UTF-8"

Hi, everyone,
I use chip: arm64 a55x4(rk3568)
After jailhouse start non-root cell, I found that the non-root cpu 
frequency alway 24M, I don't know how to change it, any ideas?

I change some cru/pmu registers , nothing happened.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/04066d75-c4b6-4450-9986-47d2df5ad939n%40googlegroups.com.

------=_Part_13141_1964302037.1714039069332
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><font color=3D"#000000">Hi, everyone,</font><br /></div><div>I use chi=
p: arm64 a55x4(rk3568)</div><div>After jailhouse start non-root cell, I fou=
nd that the non-root cpu frequency alway 24M, I don't know how to change it=
, any ideas?</div><div><br /></div><div>I change some cru/pmu registers , n=
othing happened.</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/04066d75-c4b6-4450-9986-47d2df5ad939n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/04066d75-c4b6-4450-9986-47d2df5ad939n%40googlegroups.co=
m</a>.<br />

------=_Part_13141_1964302037.1714039069332--

------=_Part_13140_1543085474.1714039069331--
