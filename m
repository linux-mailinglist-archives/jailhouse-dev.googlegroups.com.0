Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBL7HTOPAMGQE4OO5KFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13e.google.com (mail-il1-x13e.google.com [IPv6:2607:f8b0:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id D312866E6B8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Jan 2023 20:14:56 +0100 (CET)
Received: by mail-il1-x13e.google.com with SMTP id y11-20020a056e02178b00b0030c048d64a7sf23493936ilu.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Jan 2023 11:14:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1673982895; cv=pass;
        d=google.com; s=arc-20160816;
        b=g7AoWoKEQ4Ml5qWf+SF8tbBKSqAGOOQxBxd1Bx4Q3cKTIURG+DNmK1X4k4oldBP/2u
         9715FnShaMwh6QwOdb/2WTQnUdk2wxoCjcLmnrW/rnKaE0q6+n3q2t1w7H9lQFSbCGDA
         8Ur2kYh6trPdGdEaPDpWwSeyLSfg8U7VCjllOgxs7nBpphGSayxsvXk1qBVl6gB7z9ju
         zYyZoSvVU1sWelBbjjxBVsEI6X08bpcn4D2i2cYnF4Pe2WM2/fiiRiHMmA8BpyphMAiA
         alwCsWLgLmTIafxHvDK8bJVjGtdwpYADt4Ka0N6FWOD8YyhG0a122hf2MGICPYAPZEUc
         SuWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=sK4P13xIx8AQMhWzq2fKQqGSurLjs+tkUeBxDpv18CQ=;
        b=AUObo/sceqMKeYsaX0nZiNYu+qBImTYR2jTCGsWQGax1Hl6N50lY7FQr3eqb2kB4j4
         XI9JHyIA/Y6daok+37MnPkj7rCREzBfz/qRpRnrc+SVpqMESbBrgAP44/ksZLMdimCci
         +CVW17waFsj6Zy86GRstVBx4SUghAsQ53oEoMOj/9MQhJhIysYAKuc3sG6NJbs/LTcX7
         /dXFffjXGlsgcgH5peEOK4Kb2sFJg9rNwhaElGLAm1eZr5/ZWJmt2jHXGSa+BWWYjx5b
         FkznmMPCbpYh853brS5Xi98MJTXYqG4nKWD669Nz3dgTPyl32QRGXr44zBum3tSecmt2
         B9NQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=nl83aVmx;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b2e as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sK4P13xIx8AQMhWzq2fKQqGSurLjs+tkUeBxDpv18CQ=;
        b=tdTIpvl0u458yNPmn7PICFqnoIFqcV3g3Ud/fYvd5za9Pfy/978+MXFBQyklEsnO+C
         qhkJ9QwJdIInsb4ljQz2izwB6ycXwE6ZZnHqThqHSohBJzKGhiv5AZUOoiAe8eNj+zb9
         UltoLJosDMi2ulBIgh6suHrGiHwsoK4GnovaNXs4k2O9e2Q1KGbEfVPtXN98YgKzQ3cz
         UXalPsEQia9YQzyV5pcXKutPMcZy7GiQJKoYFE0VnM1fRE4TAIEpNIlMCoJjeJv3V+XX
         wRYeozqfd247g3O9tbdoAf0JHzWvoKWlHKDY6rtlGjYzz4Lr6LCfJuyJHZWMQh5EF8vB
         EYGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sK4P13xIx8AQMhWzq2fKQqGSurLjs+tkUeBxDpv18CQ=;
        b=YL6oo5m9GSgTFbb4lOZPK8QhaUiV+Mz0TwIb2to9hGhOrSudTHCeebl5rg7UXZvCjE
         FIjJjLz99dby3JNhUDj5NgB+YDif/lfBBKIf+JAHv4JmECloreA3NDDnOModGV3h7ykX
         2hqs2udqoGT2vK6Ec2BvdYDdt727NZeMWdFUSiBuXpg33vbE9mIDDlwqjy+gUuV+GxmW
         FOF7vPjncqQNStkPie7+SaS2HY+aQOigTi8sef/5fpYKNGSTxdBaHiSpbShc95KMvQll
         kaxa0qS1MXgKvRrjlLondBf1Q2EruhHL+el7oK+q7vPgEsCAsQIfKaSPWXllkMhEaQu4
         csEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sK4P13xIx8AQMhWzq2fKQqGSurLjs+tkUeBxDpv18CQ=;
        b=jWNk+qJhsqao7/XY6l838cqtDUKIRpC9/z7A/zgHLdhC8gSeTY0/NOZHHuKMNG+XTm
         pBbiITyWZkVhU2folrli/YMpfK1CllXbtbkin2nBUVbxBywQD11RgSScEdNEcAEshyzK
         ssG7MjOD4BY6qaAeVyzAEtjQ9WwabWGKqxs0H6vRUJ/KLTMxZedtT9un2JjbvANdcBcK
         restS+uuCSj37nKr/bC9LG4ZHMUBJV976OJXKDwzev05THgNmsdvUghYe5kRDPDLUC14
         ukoeWBQ8MNMBhI8URivJq3KWyjGlRD4ihZn4HseGtYcdtMZc5yDxaVZBCOzQUhnOlHfU
         Nqxw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kpeiwBilXv/zSzy1BYEp2YkOTFgHwMgHjSUeQx/VGsk7qDdCr/p
	uHlMr/sCrMeboCGpszyh5cM=
X-Google-Smtp-Source: AMrXdXulw5v1Hm+XSnY0W9Gqtpck/IMFTz0hDWRtFtXb9rB0oOSdQ/haLQmB2Ph7yEf5DzVUPMUpAA==
X-Received: by 2002:a92:dc0a:0:b0:300:f5ab:3ff2 with SMTP id t10-20020a92dc0a000000b00300f5ab3ff2mr382039iln.13.1673982895475;
        Tue, 17 Jan 2023 11:14:55 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6e02:dee:b0:30b:f63e:3073 with SMTP id
 m14-20020a056e020dee00b0030bf63e3073ls4686086ilj.5.-pod-prod-gmail; Tue, 17
 Jan 2023 11:14:54 -0800 (PST)
X-Received: by 2002:a92:c011:0:b0:30d:859b:156a with SMTP id q17-20020a92c011000000b0030d859b156amr3537611ild.16.1673982894747;
        Tue, 17 Jan 2023 11:14:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673982894; cv=none;
        d=google.com; s=arc-20160816;
        b=K4HeDelGiVcO0qKT5qIW2bjlzjKCU1LtBdF3+q121aphw5ogCdwPguXDIXYrhYifVz
         OdoUMG3ZjvE3AOEdtN2NNnFzblwRID/qZBnqPnve2QEZYhbNemhLi0iNoaYmrKVMGCbg
         q/2OQGeSAgPjN4a17tZ/LiKs+scbWG5yQiI3vS5llxKaUe5qF7F3gXUSy96MeAahSkFp
         auc8cVMsS+fp6c/7UxcOj3P7chtWOJZ1/Gcxv6z9B5dsBOT55C9KmaWOolNmo8alf2RN
         RRwTL5zgBt8DJkGG4IntGiXkTaZwArATYK393Q9aJ9hDT1QSRz/oW0AQ+lonoJooK10b
         PeMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1ZXUOzgnGIHus9BaLfS8Qh2xDNS2DUKXwhiOcmF+H0k=;
        b=YAwvsob3dwccIgbmZxoWnAOi4jgdrNlFeM43QcIDQkBiHHMr853Vsiy6Md4zsS/8/X
         IvnrYQacrrGMuqR0SO0lyC3AQL0bk023aFANeYwE/lnZCT3Ncq+WAelkECy0/YXv66JR
         in/rEw3/uGTR5umPdNnTyVquwPOTTm1NNB5TkMe96ZMkpRjiRvex3Q3yb15wpEovgAFQ
         A7ALtapPbGi6wb+WLT2HmMitBDOV3cttklRkEDwctSYM0kr5PCTgtDPdh4SieswuPXjI
         v4zoCa8vT88tYh3z+LY9MocF1J18xdfs4aW1UkSKwODGYqtwa5DKfvhunHnSwWBuMACf
         FdCg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=nl83aVmx;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b2e as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com. [2607:f8b0:4864:20::b2e])
        by gmr-mx.google.com with ESMTPS id r5-20020a922a05000000b0030eeee2e081si1089746ile.5.2023.01.17.11.14.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 11:14:54 -0800 (PST)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b2e as permitted sender) client-ip=2607:f8b0:4864:20::b2e;
Received: by mail-yb1-xb2e.google.com with SMTP id 188so35295756ybi.9
        for <jailhouse-dev@googlegroups.com>; Tue, 17 Jan 2023 11:14:54 -0800 (PST)
X-Received: by 2002:a25:f305:0:b0:7b8:6d00:ef23 with SMTP id
 c5-20020a25f305000000b007b86d00ef23mr571610ybs.119.1673982894244; Tue, 17 Jan
 2023 11:14:54 -0800 (PST)
MIME-Version: 1.0
References: <20221106230523.22567-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8uMPfCWMPxJ90AE=dzLSiEEk61Pn4Oxicpv_Sxd9hVhHg@mail.gmail.com>
 <a9e1e756-978a-f2de-c4cd-838f1417a8fc@siemens.com> <CA+V-a8u7x=JW1XE8xAcj_uH4EBw81mS8Lk3t6ZKf+ScgeiyO5w@mail.gmail.com>
 <c81bdfb1-055a-071f-8838-66b35173241b@siemens.com> <CA+V-a8vGTk42JrrN6_5N21i_mcUgsuzVc+v0wT1VQUaqmjcrEA@mail.gmail.com>
 <e26f0792-ec58-9edd-1bce-dcc8a6df0382@siemens.com>
In-Reply-To: <e26f0792-ec58-9edd-1bce-dcc8a6df0382@siemens.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 17 Jan 2023 19:14:28 +0000
Message-ID: <CA+V-a8t3nrEiDV9b--ktgAKy3UVVUrg32N6O9gT=J6NRFdQyDA@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/3] Add support for Renesas RZ/G2M
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, 
	Chris Paterson <chris.paterson2@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=nl83aVmx;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::b2e as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Hi Jan,

On Mon, Jan 16, 2023 at 5:26 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
<snip>
> > I had couple of question,
> > 1: For the pci_mmconfig_base should this PA? (If PA what range should
> > be ideally selected and should this be reserved in the root cell?)
>
> If you have a emulated PCI host controller (which is the common case on
> non-x86), this address should be free in the physical range of the target.
>
> > 2: How do we calculate vpci_irq_base?
>
> There have to be up to 4 unused (but GIC-wise supported) interrupts at
> that base.
>
> > 3: When do we need to configure the stream_ids?
>
> Only if you configure an SMMU. Do you have one and plan to use is?
>
> > 4: For the IVSHMEM 00:00.0 (demo) the PA range should this be reserved
> > in the root cell?
>
> The PA should be physical RAM that is otherwise not used by any cell or
> the hypervisor itself.
>
> > 5: And similarly for IVSHMEM (networking) the PA range should this be
> > reserved in the root cell?
>
Thanks for the pointer that did the trick. I am now able to ping from
root/inmate and vice versa.

* For the Linux (root/inmate) IVSHMEM what is the test case that needs
to be run? (Ive done devmem read/write on root & inamte cell)
* I updated to the latest tip of next and now I am seeing below issue:
  ** Previously "jailhouse config check -a arm64
renesas-r8a774a1.cell" worked, now when I run "jailhouse config check
renesas-r8a774a1.cell" I get the below output:
        root@hihope-rzg2m:~# jailhouse config check renesas-r8a774a1.cell
        Reading configuration set:
         Architecture:  x86
         Root cell:     Renesas HopeRun HiHope RZ/G2M (renesas-r8a774a1.cell)
        Overlapping memory regions inside cell: None
        Overlapping memory regions with hypervisor: None
        Missing PCI MMCONFIG interceptions: None
        Missing resource interceptions for architecture x86: None
        ^^ Architecture detected here is x86 which isnt correct.
* Previously  "jailhouse enable renesas-r8a774a1.cell" worked but
after update I am getting below error:
        jailhouse: Configuration architecture mismatch
        JAILHOUSE_ENABLE: Invalid argumen

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8t3nrEiDV9b--ktgAKy3UVVUrg32N6O9gT%3DJ6NRFdQyDA%40mail.gmail.com.
