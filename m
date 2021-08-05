Return-Path: <jailhouse-dev+bncBC2PLTFIYAJBBKV6WCEAMGQEKXBYWKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc40.google.com (mail-oo1-xc40.google.com [IPv6:2607:f8b0:4864:20::c40])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E613E1A51
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Aug 2021 19:26:04 +0200 (CEST)
Received: by mail-oo1-xc40.google.com with SMTP id u64-20020a4a21430000b029026aefcb0601sf2170688oou.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Aug 2021 10:26:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1628184363; cv=pass;
        d=google.com; s=arc-20160816;
        b=DMUTzqUqfOLEmqLyeElnDPna9HFs4Nuxt43QeyIfVG7PE6RGbOWXNrJEwKG58XBmvP
         mCro0ETf/AKYZBjJIeVLukXxoPP4HkBOKKGcKoBvaPE5l9q5GeYok1mKbokvhdFFVQn1
         SuCtE8gQ9Gq54xJh05s4XLrACM2nahjz6Ul7aBSEI46pgqZYMUBfaOO16+ABM9t/s8fh
         KNhC/CZeetqNJ3En/7aFT3bqTgTVPZIXW1dTjsgX9zkKxTzM1o0zYi+QjyTsQ/KIPdun
         H8RFd++8VkRHfZx4X3xWK7olPDbT9NYqYDfkpfyUuky44SmaLk8ihri79P82fwSL/P4b
         WNDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature;
        bh=jztaSdRBFiMrYrsoinu3mDGnEkQGcrQZ9sGdiiP0s0U=;
        b=R6977D8DsaHLaWoe7ld0uTz4oj57hmM/vPyBjYK6BEekcGZzlPzL63oMTS92hYO6RU
         G96xZ9QboUojOj0Dr2gcMt3KULNxX2Dj4Xs1FjLvPtRdpVK0763ZTHxAc7j9aPROIx2W
         nSghCGQ1n+qe6h0XmODnNFtb3CSYXfK7bADamW3Fn3rkPKIRGCTCWg6KfSSuShZ2ouPF
         xHLPjpwguvtIpv5z48ztZmp3ZEcmlpqqlyDSeTkpoj71Zb3wb5+hF/Fly8vEfE/qRklT
         JF5Hb1VRJrNT7nhbdIHJdkzjS3w4BYNllbrK+xhcJcVwN6jpgr0UPUWkbBHaq0+LqjEP
         lJsA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PWKd3nMv;
       spf=pass (google.com: domain of jsmoeller@linuxfoundation.org designates 2607:f8b0:4864:20::e2a as permitted sender) smtp.mailfrom=jsmoeller@linuxfoundation.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linuxfoundation.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jztaSdRBFiMrYrsoinu3mDGnEkQGcrQZ9sGdiiP0s0U=;
        b=lDuoLSAVnt0EolZauRNScYF96Hf7WT0iwezgjDBHoKkaMt8+h0Qmgq3HXgHxuPlLeH
         iojHSVnSseUPSAOUdyjaUIh2JvznFAAV9SDhQLSWBgGblMYhhVB9Idvz68sW9XTwT7fK
         FVQop/ywFHenUXaxkMzpkQkihqI8lSFzjvXgRzgJBDBwqXeiu2J6ZHrmXt8ak9Jbq0Rn
         5sr/m9hK7Ijlkun13DoZPXipn38fA0J3UGWsPy98bwfwlH/jyTwLhZUkdyGZmNZVlT2L
         RWnFiRN+mlcj6+dR4Doxw7RpP2VyGXcxQqtkMvFw1kuQWJamISweSZ02wMJ+rD3dDmgI
         I0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=jztaSdRBFiMrYrsoinu3mDGnEkQGcrQZ9sGdiiP0s0U=;
        b=clkLCK15dyJfaRW8KIwI72pzx5bTfM+J6CgsS+9dyDyZLq81+6Tp2HVhrsbO1ReRWD
         pC5LPAxjmUWUDqCBCAGVTslCqcuuPx4mCeJvDoujsB1cQA7oXWBAU5oDCGdG9OgPsAfO
         NOUH92RIWwXtR/3QnUb6TmoAGN4lF7f0EJebY0FqAlbdgBwXC8QbBLt/suDxvj9GSfJB
         cncRCSrHDa7dOMPF1bnaI0ef854/7RZlCcbLNYvJqkV8+bxA0npquQqsPjttjyEkcOUU
         /rsG1J3sk9ExN+pFu3iWphGi0VrhQo/kfMDdI+n4Oh2LplbVNxMnPfYOIVVLUlbOz+4v
         LdLQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533y76Qe5SCy3RfivcYNlwBF2RLdf5aiuym8ajQ7NhLLGPEthqMO
	1j3Z3hmVdnPYRT6Iy8VRmSw=
X-Google-Smtp-Source: ABdhPJxET/A1WNRx3aap9TnMd1/rieU/1iV4TmdiH7UIvY7ODYsr5QHLMhCTonZ07V7eTNsoAmNfhA==
X-Received: by 2002:a05:6830:438d:: with SMTP id s13mr4635851otv.288.1628184363132;
        Thu, 05 Aug 2021 10:26:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:19aa:: with SMTP id bj42ls1634703oib.6.gmail; Thu,
 05 Aug 2021 10:26:02 -0700 (PDT)
X-Received: by 2002:aca:bf84:: with SMTP id p126mr4334066oif.154.1628184362627;
        Thu, 05 Aug 2021 10:26:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628184362; cv=none;
        d=google.com; s=arc-20160816;
        b=lsErqtiEFHQEG3ePSNtPfr3YK45lxOx1XVdXgiezh74ycmLJcnmguvU6/5Cjaoe8Mg
         1cdYIgueJmxLZCMhMYQ8utkhsRfPsJRhrOFiXkvayao41c0jbYq1vExy/AAdvMnoCSbj
         Q/QdB4rSppt5YXgs8zTXFjAyFmwK1CS4ZuFjPHGnPZsRbryj+3ukPp1GHatuoW+PZ0mh
         j1k+sJTufZpsFAfoLGwGjuUMBA/n+ospnwaAi7AA86w1g0mgRCMMJHnaQKDsW5be+IOI
         sX07fg5JH1QrrTxHI+iZS27/KIthCKh892pevbLuBJ4zCvVYl6mPehoALylhKY4nkZk4
         P3Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Yz0m/uuh3jkks0l+4Ul5jnSuktpq8dftqg7GOVmZDTY=;
        b=cLDIGQgCWLmPklkq7oMDRm1RSnL5+jbGKvOZscr6ZDeYRcpp92kHjXU4tOPqhFhv6a
         3iIDuFBnMJ74Xo1EAlN9X5v0Bi19ktTTgScl4ybzFaFQfl1FxLemTmOh4JoC8xARSJlm
         O/fQD7I9edodG4UrqQCSmzyqQRY4wvCB3HWBvfr0w/d36k94u2c1ZFoLhbQUkPqHfcxL
         xP5CbEwhbBwXMdMo/AJYqp4oy0QMDWgBViCN6Yl4C4CRmxfYeJg/AZCA+uF+s6TeIsMA
         UGKzv0wtrdmMcL02jyFQ2OClrsZumGvI/Lfg25Q3EOEY8YOrL+uNn3LGFIQpXfPWqxMH
         nYeQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PWKd3nMv;
       spf=pass (google.com: domain of jsmoeller@linuxfoundation.org designates 2607:f8b0:4864:20::e2a as permitted sender) smtp.mailfrom=jsmoeller@linuxfoundation.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linuxfoundation.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com. [2607:f8b0:4864:20::e2a])
        by gmr-mx.google.com with ESMTPS id b9si423903ooq.1.2021.08.05.10.26.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 10:26:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsmoeller@linuxfoundation.org designates 2607:f8b0:4864:20::e2a as permitted sender) client-ip=2607:f8b0:4864:20::e2a;
Received: by mail-vs1-xe2a.google.com with SMTP id j10so3519156vsl.10
        for <jailhouse-dev@googlegroups.com>; Thu, 05 Aug 2021 10:26:02 -0700 (PDT)
X-Received: by 2002:a05:6102:f08:: with SMTP id v8mr5976315vss.40.1628184361763;
 Thu, 05 Aug 2021 10:26:01 -0700 (PDT)
MIME-Version: 1.0
From: Jan-Simon Moeller <jsmoeller@linuxfoundation.org>
Date: Thu, 5 Aug 2021 19:25:48 +0200
Message-ID: <CADja47POaMbuona6FYVzgzwuQGawEF5x_ma-xAMYWXMpO2tnXQ@mail.gmail.com>
Subject: Qemu setup for testing jailhouse on different machines (amd/intel host)
To: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000831a6905c8d33689"
X-Original-Sender: jsmoeller@linuxfoundation.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linuxfoundation.org header.s=google header.b=PWKd3nMv;
       spf=pass (google.com: domain of jsmoeller@linuxfoundation.org
 designates 2607:f8b0:4864:20::e2a as permitted sender) smtp.mailfrom=jsmoeller@linuxfoundation.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linuxfoundation.org
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

--000000000000831a6905c8d33689
Content-Type: text/plain; charset="UTF-8"

Hi !


Is it possible to test jailhouse on different host machines (amd/intel)
using the same qemu-system-x86 cmdline and the same cell configs within the
qemu vm?

I looked at start-qemu.sh.  There is still -cpu host, which might leak amd
vs intel afaikt into the VM .  In my case we'd care more about the
reproducability (e.g. dev env or ci) than for speed.

Best,
Jan-Simon

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CADja47POaMbuona6FYVzgzwuQGawEF5x_ma-xAMYWXMpO2tnXQ%40mail.gmail.com.

--000000000000831a6905c8d33689
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi !<div dir=3D"auto"><br></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Is it possible to test jailhouse on different host mac=
hines (amd/intel) using the same qemu-system-x86 cmdline and the same cell =
configs within the qemu vm?</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">I looked at start-qemu.sh.=C2=A0 There is still -cpu host, which might =
leak amd vs intel afaikt into the VM .=C2=A0 In my case we&#39;d care more =
about the reproducability (e.g. dev env or ci) than for speed.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Best,</div><div dir=3D"auto">Jan-Sim=
on<br><div dir=3D"auto"><br></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CADja47POaMbuona6FYVzgzwuQGawEF5x_ma-xAMYWXMpO2tnX=
Q%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CADja47POaMbuona6FYVzgzwuQGawEF5x_ma-xAMYWX=
MpO2tnXQ%40mail.gmail.com</a>.<br />

--000000000000831a6905c8d33689--
