Return-Path: <jailhouse-dev+bncBCVKRBX6ZUARB2NWSXXQKGQEINTFYQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x240.google.com (mail-oi1-x240.google.com [IPv6:2607:f8b0:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E6710EF70
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Dec 2019 19:43:55 +0100 (CET)
Received: by mail-oi1-x240.google.com with SMTP id z143sf325183oia.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Dec 2019 10:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=99VUU3i/avgwsnA83ehzEESoKBs81Nn0Ymo+sSd8jnE=;
        b=RQF12EHkJRLzSv0Dz6SXzqkqwHhaeIqWnYeA3qmkalBYiRnlvLGX1dn24dD+eqlB4/
         HQy/fSQaIb33WxAyUOE4VHfjWoBlVEGHZI7qmqqXmRhDcVJ3AHzaoOmf3V+zkTv9q3zt
         C0ntit8m6CsP2IYMmh80+mM3chmTxzQuFx06h/ZwCRnVTgqFir798kxqBoAIfkbbdCng
         WrAgXtZvmbXG0o3WVWd8HRH3+zx/HBO7P5xmVc7W+GBd+kw4xtpIBFt+KkTVEFIVonaK
         jp0PLJ7SUwkKtqv/LHr/XtfkFzOMNu6083XQY5q+1v7lzJ4YhsERHQ8q3r2NP2Q9VIBA
         ah3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=99VUU3i/avgwsnA83ehzEESoKBs81Nn0Ymo+sSd8jnE=;
        b=XgkXrUDSTRdzu/gSq1BAybIB0QxUIK6qQKNDko5dqMZ10GEHMFsx+xSFCN/YMmHIBM
         dgliiyupwHVIIIM0XMcgqw9Inlrgn+d/TPLIf+Nus2KXkn66PrUEztzwNPVz85oSiR5n
         YFnxVZZ1BEkC6wZTARNa0omSndmsEkRThpTqI6QAwyew6gwEurP/PBKs11L9DXUIHMMY
         k7MEmSAAJr5oM+nQpMIAEJU2epKh/FTCzlxx2S9HqFl5+jK/+pBN2D8LTk/Bi+ldlGfI
         T3GHrk7bdjGJZTMQhTzBHEvsoJRTOe/0Bpx60FiTp1oChcdaClNAt8BkKb3w7TOfEQP7
         RYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=99VUU3i/avgwsnA83ehzEESoKBs81Nn0Ymo+sSd8jnE=;
        b=HyKo1hZBoVGAfaffYVW9RZTrWJ2J6M99eZiqCQZAde2KGk4zmMPDiKi7pRX0g+MpVU
         uB6h6G4xiMSht7wWI1xZhzkOm3kOEnigDAjzExdpa2JeU3YsJhzPLND3otb24WYb9MFH
         Lg2V80g1JwScg3lu3+GITcXN++seqEBwfYR95RLu80wkdUjsy7OHmJLAFfNMytD/a/J2
         oSueEQVgyt974d0npj1hRHXEfhKJUIoBjU64lLiKnafx7hDzzmRRn6Ka5+y5DxfXk7pv
         AtVIh67KYNTSRVtiDXwrnQ0QJ7ovPWyYqyLTraNShALC/VgaoJKY1feesBuwcH/jxMLL
         gzeg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWDlXt+8DZ7FGrRb8pHcqUXXWhsDAB9nf+JgYMroIpfLaPy205s
	WnnRlzAFso1TS7oYFfssrEI=
X-Google-Smtp-Source: APXvYqwmT8um5nO+DPX3eiODPyvrtnRvEUhzbejZVvpWmOk1UliHqryq+Cfur0gh0jEhbNfOPU27pw==
X-Received: by 2002:a9d:7d9a:: with SMTP id j26mr365366otn.283.1575312233827;
        Mon, 02 Dec 2019 10:43:53 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6a01:: with SMTP id g1ls130674otn.6.gmail; Mon, 02 Dec
 2019 10:43:53 -0800 (PST)
X-Received: by 2002:a9d:73d2:: with SMTP id m18mr366747otk.150.1575312233198;
        Mon, 02 Dec 2019 10:43:53 -0800 (PST)
Date: Mon, 2 Dec 2019 10:43:52 -0800 (PST)
From: Manivannan Sadhasivam <manivannanece23@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e4de0ebb-83e6-4010-8f17-7cbbdafec19f@googlegroups.com>
Subject: Zephyr as a Jailhouse inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1938_302157546.1575312232595"
X-Original-Sender: manivannanece23@gmail.com
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

------=_Part_1938_302157546.1575312232595
Content-Type: multipart/alternative; 
	boundary="----=_Part_1939_1513396444.1575312232595"

------=_Part_1939_1513396444.1575312232595
Content-Type: text/plain; charset="UTF-8"

Hello,

I can see that the Zephyr RTOS has been mentioned in the FAQ as
one of the ported OS for non-root cells.

Is there any reference code I can look into?

Thanks,
Mani

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e4de0ebb-83e6-4010-8f17-7cbbdafec19f%40googlegroups.com.

------=_Part_1939_1513396444.1575312232595
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I can see that the Zephyr RTOS h=
as been mentioned in the FAQ as</div><div>one of the ported OS for non-root=
 cells.</div><div><br></div><div>Is there any reference code I can look int=
o?</div><div><br></div><div>Thanks,</div><div>Mani</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e4de0ebb-83e6-4010-8f17-7cbbdafec19f%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/e4de0ebb-83e6-4010-8f17-7cbbdafec19f%40googlegroups.com<=
/a>.<br />

------=_Part_1939_1513396444.1575312232595--

------=_Part_1938_302157546.1575312232595--
