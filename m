Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB5ME7DUAKGQECNPNY6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6745F948
	for <lists+jailhouse-dev@lfdr.de>; Thu,  4 Jul 2019 15:43:18 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id e14sf1477999ljj.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 04 Jul 2019 06:43:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562247798; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZWeF6V0svm5trKljHxRJEYOemhFhjUiOR9vosHSHQWtQhrasDtvzyBQuMRl7OXcjiT
         2oq3FLXH+pWZqwCM8MQcV3p9VVfOT50CTeQVvYt28JSlCLSetT0Wgnvas9u8LDE89gYM
         9Rp8nTHhUFczjCBm5ulYTzRvW9rsS7pVD/7h2sd4kTvxbzGBD2HcOo0R1L+BWCNqWTLl
         jS0RaUBH38U/Ae4UF2uRGYytVgA8xWn17nHekceBb6RoxLvD9BHakrlwWK99nHibIRlC
         mxMXhzD8omCiTWLqf6wuQembxYo5XLkYEJG5x86t23l0W15MescM9UsGnCBlUao9GDIj
         EFyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:mime-version:user-agent:date:message-id:openpgp:cc
         :to:subject:from:sender:dkim-signature;
        bh=NF+/cv2gHlMx9KkZfu4owWhsekIJagLWedlvHjp8sxA=;
        b=Dnd8iZ2k61h4hTqjatsCIgwhoCY3LOaYgy0AnaFYe5SbrkSr8ifUA1x4p0FxvXf0Fb
         a9JKxxf5eO1itJgCUpXaTV/TDAtsufLSxWIkbBYPJlSmFn6lXpQNi25HYImpPgKlfjL6
         fKX18cOnmn4gAPOfqg2eu3xTD+d5jCACC1A8GPhZOTfMH4MxTuCLEw6zOGujclFAFr06
         dxowqjDg8DfGgRRiak6c+Y9vj3FNWpXRWGpVyBZLLqxn0dh+8uPMV4yvm0EonvLCKRd6
         EKEiHdPoyA01NTq/3918Oc/OCfGf3BGqiknuyhdwaDmT93bUHtrixgZ2KqZJpJhDCr69
         DsJg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=DnbeS+vR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:openpgp:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NF+/cv2gHlMx9KkZfu4owWhsekIJagLWedlvHjp8sxA=;
        b=AQehSbKx1vQQpKbTe/iwynNy6iV0eOTEba+zW7WoD8jkgsO6B5SZhl01ixM0CyRhoa
         8aQdEIwuzyodcaHTC3kBnYuE/WMnD5xV76x4sa0+SGJU8b/AQmYRhWAF6zHlurIKZhPO
         a3rfxrqD0VdQuxK3jQmW1cmhPUP/hWbJOjYXmbDqThGMxdFcnBRhYuk1ldPLwYrMTdRs
         dwoVwh6WMIb134onkxBVtEKrufF50Bhpcz9kHkaHHzBz1MRn22kYRQpXmB6hJ+MFqMaq
         Vi+82ftRe3wyaf2MUe/CWCmQMAsqNeJIsSjKCp+/fZoPQUPcXDlGM6smyHcX00ecVXNA
         84dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:openpgp:message-id
         :date:user-agent:mime-version:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NF+/cv2gHlMx9KkZfu4owWhsekIJagLWedlvHjp8sxA=;
        b=XPnfzqmRJTl2Zvks7gir8TDw2Y+AiOSNCf5KQ5kT5vDsG0q5PA2RM4VGEoh/xZtmFc
         zygiPxFLttcEG5I4U5WREMZoUOeYCxBLG5LxPRTNZ4Ni85DDjTBic1oIbdA2+oOLNLhW
         EB4shYe/4/H5nuZ0I51sxLACn673A3Fviw4Sc1IyyJ5xVktxepzkXllnRXxa3qbmH0Bz
         WyS+jKyecoGBUCcV9LP/Sx+lHd0kjLgFh9bZ6KmEgT5sZBR7+sYMuSCtvJuLHOWAeKfL
         1uSq2yPVcO7aeVIAG2TtHUSeuQInMWX03LlRljc6UtE4OHXjULsuR/0/R3egJNW87bGs
         DIbA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUorZMu06KwkmuT0f3qM1qJ4revNlwucLoFCHOcX5HSnU76xFRr
	x9+GLSzJY69+ZdsOpN/cCus=
X-Google-Smtp-Source: APXvYqyDUEJa77I5erpvu2fHAOrQewFSxLixxEVZLfbzfN+L4UD9iUef9FI00whQYGH4Us9HsKciXQ==
X-Received: by 2002:a2e:b167:: with SMTP id a7mr9540604ljm.26.1562247798131;
        Thu, 04 Jul 2019 06:43:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5dec:: with SMTP id z12ls510125lfq.4.gmail; Thu, 04 Jul
 2019 06:43:17 -0700 (PDT)
X-Received: by 2002:ac2:44b1:: with SMTP id c17mr20829536lfm.87.1562247797450;
        Thu, 04 Jul 2019 06:43:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562247797; cv=none;
        d=google.com; s=arc-20160816;
        b=q3XAfH5bA+fLphqSBMwq/c7b1v2/Y49mfymwjm5Gn6bUwlRt4YeHfpqaYUInMslfJK
         OZa6+dZQHjfzVCofnsqunch6GYwYg0Z+1gmmwej7x5x1JuvVkESeY+tCnNamMhBtzroX
         D/6N4yYorKdHHsU8x89CMox/m0EFWwGf/g0b4hTXYwzsuWoI36j4ByptEOI5+l4YidEU
         75pI1Lt1QIAm1cRr+JecTTWcRIAuu6jRxqvHR7OCtX8aq9yM/GokgQGXN2QFT7UYVLE2
         mfMdCSTebsrZUM5/7Bk29iUOtno7jyJ/XqCzfHlgnbts/NlL0g6zdbWyikFRMZl/D3Yd
         rC/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:openpgp:cc:to:subject:from:dkim-signature;
        bh=4YqvvVpjVhLohUEnOt47mDWY40RlwhQeKLYsh8hgj90=;
        b=o5qmuCsrN/O+dtAD33MTQZDW5lkfQr9EUYyFdI+b83xKFAf01NaIyc6ZQ7Z+0ei9hj
         iLfPjpHswQd1XPYKXYgO2wedeAXOxhWoupytu6ga03WkysGd2kpYQE2/R5emoQ6B1UQa
         XyZNsCzzLDfsWCIDjohqZrdiKY5vHK+rGxREJ8ZphujEyVbXYrFKyDo6y6mQMS9aZtg7
         WCly6jSCR4dcmF0ILSKymVQMtpa3femSl+WLzph3yST0/3CzLZQosRmmodvSrW+oIEva
         R1ekNiK2lUxxHDGNEtRuKiEp6NLm0CsuDlPUwzd4FaFjmA4RLBunXin/Jh/XIWMYwLPZ
         rs6w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=DnbeS+vR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id z18si343090lfh.1.2019.07.04.06.43.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jul 2019 06:43:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45ffLr2t2Kzy4b
	for <jailhouse-dev@googlegroups.com>; Thu,  4 Jul 2019 15:43:16 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 4 Jul 2019
 15:43:16 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: AMD: non-root linux inmates
To: Jailhouse <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <c2839a0f-c1b5-9139-43d5-01139341981a@oth-regensburg.de>
Date: Thu, 4 Jul 2019 15:43:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=DnbeS+vR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

we have some trouble starting non-root Linux on an AMD box. I already
tried to narrow things down, but it raised several questions.


The main problem is, that non-root Linux tries to write to LVT0, and
jailhouse crashes with:

  FATAL: Setting invalid LVT delivery mode (reg 35, value 00000700)


Turns out, in comparison to Intel x86, we don't trap on APIC reads, we
only intercept APIC write on AMD (cf. svm.c:338). I thought this would
be the issue of this bug, as that's an obvious difference between Intel
and AMD: on VMX, we do trap xAPIC reads and writes. However, VMX works
slightly different in these regards (side note: [1]).

xAPIC reads on AMD systems don't trap the hypervisor, so I intercepted
reads (by removing the present bit of the XAPIC_PAGE of the guest), and
forwarded the traps to the apic dispatcher (adjusted VMEXIT_NPF).

I can confirm that we now trap reads as well as writes. But the non-root
Linux still crashes with the same error.

Digging a bit deeper, I found out that xAPIC reads are directly
forwarded to the hardware, if they were intercepted. So this explains
why the bug still remains. This raised another question regarding xAPIC
handling on Intel:

  On AMD, we don't intercept xAPIC reads. On Intel, we do, as we
  follow the strategy mentioned in [1]=E2=80=A6 But why?

  Wouldn't it be more performant to just trap on xAPIC writes on
  Intel? This could be done by switching from APIC_ACCESS interception
  to simple write-only trap & emulate (page faults).

However, back to the initial issue. Looks like the difference between
Intel and AMD boot is as follows.

AMD:
[    0.325578] Switched APIC routing to physical flat.
[    0.366464] enabled ExtINT on CPU#0

Intel:
[    0.099486] Switched APIC routing to physical flat.
[    0.113000] masked ExtINT on CPU#0


This is why the above-mentioned Jailhouse crash occurs. I tried to find
out why Linux takes this decision on AMD. Our victim is in apic.c:1587.

On Intel, apic_read(LVT0) & APIC_LVT_MASKED results in 65536, on AMD it
is 0. This is why we take a different path.

Now the question is simple -- why? :-)

Are we just lacking ExtINT delivery mode in Jailhouse, or is anything
else odd?

  Ralf


[1] Regarding Intel VMX, why do we actually need the apic_access_page /
SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES dance? On VMX, we do trap on
xAPIC reads AND writes. So why do we need virtualisation? Why don't we
simply trap on MMIO and handle these situations under
EXIT_REASON_EPT_VIOLATION?

Is it just to save the dispatching or is there another reason?

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c2839a0f-c1b5-9139-43d5-01139341981a%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
