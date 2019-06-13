Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBGVBRLUAKGQEG6TISAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id EC19C44A44
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 20:06:18 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id v7sf9135376wrt.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 11:06:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560449178; cv=pass;
        d=google.com; s=arc-20160816;
        b=aHT+G2t9BfoWMC4WX+OLv64Ve5JPhpkpV8AYPV/B3VRq+C/+oQYnfIut5kNrvQEfxK
         oRzcXnMrow7MdAiledvOA9/qdQivFq9xSyrQw6trZVZDYffKrFhBXhv3+15dyF0m6syO
         gv6bdVSgFT8+4e+2eYupl/sgSoPjcrFqOmHF4YQHMkz6ksczvGSqRfqPicTqQKniOkqr
         yZImX0G0U0rML+STWgzT2CitPxTMGIfdrDmYpiEAi/Jp0S5cbY2n1H/vK1CyfDErAhNS
         4gBGYSFvnJWgeont+Zd+slR/D+kced3naCKuu8d8KvQoE/Jj4LkZnBhWebIogxxPT0Vt
         YgDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=lUq473gTaOKdRcMkOHQ+R5HDeWKKgWzKocqJnmxV2ZU=;
        b=TZ5ZkUUknoNZSfGkrCkfvtCUmyEDv5Myb8XkWUjMVoUeWwdRMy4IYLx3RWZn27PbOq
         DhQaBbYLVWENzq6q97FqOLig3eOTLrZMIU05y5mGjbUMfv4c/UPehBQW664XL8iyHnpx
         4RAB3eTCsRgEmFu9O1FJi7rEOYltsn609fjznXRLP/3zNUAYFgMGWvG03qGOnJmA4n0E
         gNJX7mAvgt8kcpIY9d3RLMRfEdUhFZSWlYQUoMHP3Pf/feemoP4NcZJo9dDG+sfH+1+h
         IF4hdGtIulgbw0KBHeMaY60+7BrTgVBOOmfZf9yeQ6VsX13WtlWNj4TKHEsF4tvtsoFq
         kEng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lUq473gTaOKdRcMkOHQ+R5HDeWKKgWzKocqJnmxV2ZU=;
        b=KkmQFD0e7tm1RtKbaFlUact7UmjpxCgcwiArrKE3sO8xiK5bqDGnnHHS0ICQVAjz0b
         +7IqyFw9Gfx+oqmjjq1FPSMDz19OZ7Q2GPx8iu85zdfGtNKeKWasRLXphO761WYlA6pg
         S6KBN3tis0NM2uRPpMvAW5wgr72bCNM7PpDqBGoMOX68hugWcyi53YeoPnvnmuJwZ9CG
         QdzbpTDVhBEYc3FzWaFfzOgL3ChOU1iGYxOwPb9UXzPwjZw+lTMD4kyytoWcxHKHDuFS
         NWu8gR0VnfELWf0FfLwu1vvXoK7idt9xLCT8VWDw+PKvaU7HeojmaAHyu3UOLLpHiWuL
         I68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lUq473gTaOKdRcMkOHQ+R5HDeWKKgWzKocqJnmxV2ZU=;
        b=bvy+xWQbuLiDnKGjnqwASsf2h/zh+66Z7MPRkk1vpLtj7N1vutu08B/fe4Fcaom708
         ozNPjSxR18xxhwvNBdvAitRAWWHs+qz/brtYkYvhAP8UDmtQAcAj5xdQssLcCNhU5pDN
         O26D0JLTyx2D3FdrsPiZoMC2EGqB3MOsUbP7h3v0WDqk/suCCNRXIPoERWrdAk88fc5V
         uaVG0elE/A+puCgIERZMMOs//lMjTJbVV9JwTG6fvR+oieuGM/rkuZiZGdaqClcNpHgf
         qtT/8TBrtgD75UQCEGRNBE4S66SNwgw0X+1IbbohnEBVVFelNDhcfSH7v5N1aDFQ439S
         xywA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXzoRh4wJtiLSTppx+WpGuklAT56BxCv0yoZ9taT8Ve6k/H+ZJl
	au1wgjF8rnECFI/0M8xz2J0=
X-Google-Smtp-Source: APXvYqwwHgsFJSWaii2hLgilMcf0k04MH0SfdAmhneJ9r3Brk300nO1FOxrZvZtBALR3RO8Cf1i16A==
X-Received: by 2002:adf:e843:: with SMTP id d3mr16273530wrn.249.1560449178652;
        Thu, 13 Jun 2019 11:06:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:f404:: with SMTP id z4ls2039282wma.1.canary-gmail; Thu,
 13 Jun 2019 11:06:17 -0700 (PDT)
X-Received: by 2002:a1c:1f06:: with SMTP id f6mr4975475wmf.60.1560449177816;
        Thu, 13 Jun 2019 11:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560449177; cv=none;
        d=google.com; s=arc-20160816;
        b=VgmMPBCd7ixU/A4zhvK476nPLkzgt+CHNAVLJFeSGFVFfwc2tZ6G2RV/Op4DV+sGwM
         5fJFzQKciRWCWojoH3+OVnlFJlkTM07HQzO5JRi2lWXE/w11ukixbmKDoBD/EOTWDRae
         78EfCqpS7EhscNy6gsV+yTilmk5zKSPF08xSRsCIb8RAkYDMDCqwIvjSjxf7OAhTgx5A
         FX8svNfxWA94Hyp/95Y7l1CcHio3/+Tub5kQPsZI32fymVG8Dwv611kXe6XUr9yXFf10
         Ab9VMNTKIehmmDnkwgDMqf7NNZDmZVpuSsaT97VgL6aad1htXYnOyIAY6u9UunpGrVxO
         4NVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=QLXaGC2H35t/WqFJluot/HrPzogGVAuHxuz41pLUhPs=;
        b=Tyii1ZSBMDxa9ZnZ3ARHvJaSgh2Y8eoANhMMRJr0cqc92rSkA7uEfTmERCU/FCUMZK
         4SWlXHV3yhfg6FMXI73cHfQvivGakBaz6QgZhNiwL2/LVYZfdvidEm2FcN5gsUgTGc74
         TWDLj8yA7/8qnMUkaAOPxYM+s4x2GLrCsWPapYOAhzw5Em/zLy9Cu1G1i0rdc7GK38wK
         SzQ/88t4F7MH0aRrivHDiJxWGhZ2aU9s2EEvxBmiji/AX0eL3G6ljyF/vwFQrCFs30ZQ
         GY/Ju9y1BXmiAWft+qlT+4s/0NtbXoJYfBVDh2fWhMtEHUWLQ2goKEoTmLL8bG90k+Ar
         T+eg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id v21si332259wmc.1.2019.06.13.11.06.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 11:06:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x5DI6GMJ024417
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Jun 2019 20:06:16 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5DI6GQP027384;
	Thu, 13 Jun 2019 20:06:16 +0200
Subject: Re: Linux non-root node question
To: Wayne <racedrive1503@gmail.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <CA++Khc0yQbb3BjzCuR+6JLVqvx7EA3F5JHCFtf5FpN41CiGGVA@mail.gmail.com>
 <f0936088-a32d-3da7-a9ba-d552ede5052e@oth-regensburg.de>
 <CA++Khc0FZSWvVZZyV+4_F0TO7dHPN70Mn3LUCmq_3M2fnGN4ig@mail.gmail.com>
 <CA++Khc0O2zSeuLLY3MaeRW7cQrWbq-6Y2BHJg+x_j6nk=ECa_A@mail.gmail.com>
 <ad13aaa6-41ac-14fd-33fe-fa4f6dfc789e@oth-regensburg.de>
 <CA++Khc36sP7ABEsR5Bp+gpts0DUBENqV6eFDPazfs5kR_QRGaw@mail.gmail.com>
 <42ce8fed-792a-ac86-7611-ee9b13dd7815@oth-regensburg.de>
 <CA++Khc13nuahbog_WVD-BJi0asHEa8TxMAvB5M5damJGJ_5inA@mail.gmail.com>
 <d2e2b271-4e43-4126-5433-8304d4984e7a@oth-regensburg.de>
 <CA++Khc2LGq3gGydG2Ojxn2xcbPoc6VzvhoO4_ikFMFMdQ_aYOg@mail.gmail.com>
 <bd92264a-60c1-6f76-07f0-93cb9bd08a01@siemens.com>
 <CA++Khc0seBDnN2hD7EJh3g25unUEFqBuiRSm5HwOE+1JEX0D2Q@mail.gmail.com>
 <63552042-48d0-cb32-e893-28ae4ab29ccd@siemens.com>
 <CA++Khc3Mj=SFen+_f7RE5g1Paq1AhHQOrBX3HqNoJvvbymQh0w@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5b90a899-c42a-a360-8398-c3af35920765@siemens.com>
Date: Thu, 13 Jun 2019 20:06:16 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <CA++Khc3Mj=SFen+_f7RE5g1Paq1AhHQOrBX3HqNoJvvbymQh0w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 13.06.19 20:01, Wayne wrote:
> Jan/Ralf:
>=20
> I tried your suggestion with using the root node initramfs for the non-ro=
ot,=20
> with two different scenarios.=C2=A0 Both of them end in kernel panic for =
different=20
> reasons.
>=20
> Note that my root node is currently:
> vanilla 4.16 kernel
> "CONFIG_JAILHOUSE_GUEST=3Dy"
>=20
> Non-root linux:
> jailhouse enabling 4.19 kernel from Siemens
> "CONFIG_JAILHOUSE_GUEST=3Dy"
> "CONFIG_SERIO is not set"
>=20
> 1. If I don't provide a root arg to the command line, like this:
> ./tools/jailhouse cell linux configs/x86/linux-x86-demo.cell=20
> /boot/vmlinuz-4.19.46_GuestMin-dbg -i /boot/initramfs-4.16.0Guest+.img -c=
=20
> "console=3Djailhouse"

Try adding "-k 10" to that command. If you have enough RAM, that will move =
the=20
kernel and initrd further apart so that the former does not step on the lat=
ter=20
while unpacking itself.

Which config are you using for your non-root kernel now?

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5b90a899-c42a-a360-8398-c3af35920765%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
