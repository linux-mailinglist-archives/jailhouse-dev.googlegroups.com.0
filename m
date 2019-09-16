Return-Path: <jailhouse-dev+bncBDAMN6NI5EERBMFY7XVQKGQEEYPWTUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 42679B379A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 16 Sep 2019 11:56:01 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id a7sf17997564edt.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 16 Sep 2019 02:56:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568627761; cv=pass;
        d=google.com; s=arc-20160816;
        b=ak+/2PDy41SDShDtnJ3bbWjdMTXzULW/4iieC3lj9icSnAxpMnAfGjowB9q7vdzRwT
         10ZkUTf8qGXxoxXQrjAdSH3AxwFrfsetnOjP1C52m6QJ9a7ddMk36hkwX7mvXiB1oSwV
         GP/uB5pTGyA9zM/xMiKgqK7vY8Rmn/1mrNSsithqoQQEDyU3UJ+XgqQnX9dv9CESSKWS
         bg4SuQ/pORCHxG+Fas7TY+EZJkMc1vp5CV9WLG3IgEImiTAsHDLjTT9ToptujubpcyE9
         yOqc6x45mU4v+WnaKbfk+zLqu7mnzfDC+RQcxjS3Bm3mp8tvohZOJERJDkVmrY0tLlJC
         C0bg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:user-agent:references
         :message-id:in-reply-to:subject:cc:to:from:date:sender
         :dkim-signature;
        bh=KRTDjzm6MqIv559jo40PJGzsCq2YC0uey4nxqruls4o=;
        b=QpIJiDB4h4pxjoxkib9TFICNoo/MIdXiSgnNCKirs/+JYbGQqxJkfEeJITBzA0RGGP
         UH89zyH3vu6ukVSPYusIIkcLUyWYleKrmSYUcd2Ysb7GkzH+9SMkZUTkqCTnFlPawhsm
         vP1VDl/E2IIiLHxT8l0MNqEu44bRfceK3RRQGi1HtEu4Yav/bs79GX60UsYY/koZxnTy
         Sgci5BLHGLkUr7Znd0Lf0sw9VILAANTWLabittdGrspp2fYaLZ4MMOAOmfxcTM6LEE0I
         l65P6CqcLWn2b/iPKauhLBGTZLif1FgKOX608vYi7Mtruq+V8sQd0uYY5s/B/8DyntUm
         DMsg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of tglx@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=tglx@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KRTDjzm6MqIv559jo40PJGzsCq2YC0uey4nxqruls4o=;
        b=BSPgY1B+hetVk+gqzTiagHzqCd9IG+8n32t360xjpDd+Fpdv11znCo72HyskOViMMk
         aJym1pJW2OuQuJlVkb2J9owGr97OGVP5uIKGj+W5xBVdrcDOWmm2WZ3/ogpR+bLAYuAq
         +AG8eQMksKDZ+9+yumzTegHnk9oBgE6R9SeKwn5rHqhHT3ecfUZ0OcgRjDoy+cnkawY3
         Zbci8nuwzdzlVNHt/Q5ufELD3xI826aokcnIHoXjIYNPS0V8LOdgJi92cpHVvKo6aiQU
         byNXkBTT/OPcgCZL/nqeAzTPe2DAjMvb9yBpruQmVQFhZQ1CexoQYQkx8QRmPRVK0IyJ
         yIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:in-reply-to
         :message-id:references:user-agent:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KRTDjzm6MqIv559jo40PJGzsCq2YC0uey4nxqruls4o=;
        b=I20sICVwDgCsaYHiyU29SANTq4/EK5tXuQ2rwAYU4nHCJtHtG/9f3cr9U8fq8g+PWX
         f8+tnvjQEhniB+PxcLYT54t/pHrkpQldzt8guI5TM22Tf+36pmwPtM8vBDACvK77DS2I
         yyvw4uJzc5KfkgnGplhVzvOPwIwdiDArc8hWiUItw2dRPK3IGpbNlfDP036zINYqGrdP
         dnm6vg8JgEfjrt6cApWLEMvZSwTGLN/9+GKlF8CrGX6kr84q2tmK/5QSO6UtVF/0fMb4
         m4QofsKw61CE9eudqxG6O9CY/upBjRkKMEJfxD5UeRbFFfBolsCzRBtpm4pu4NHgv2wk
         qyvw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVj+xUSxgXofQZRP+GWiQrE3n3cbxVDj6GSkm/cBGYUH02zw4wC
	YJKMaA9c5C733PfX0zzwccI=
X-Google-Smtp-Source: APXvYqxTIOmNxA2ARrPHhoflXPW9tf0fQthTByYIRS5m5wb8dkn1G3qydWnppSEtg94n3aQ38jU/8Q==
X-Received: by 2002:a17:907:4242:: with SMTP id np2mr5389164ejb.102.1568627760971;
        Mon, 16 Sep 2019 02:56:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:4a0e:: with SMTP id w14ls8023896eju.1.gmail; Mon, 16
 Sep 2019 02:56:00 -0700 (PDT)
X-Received: by 2002:a17:906:529a:: with SMTP id c26mr51184859ejm.232.1568627760219;
        Mon, 16 Sep 2019 02:56:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568627760; cv=none;
        d=google.com; s=arc-20160816;
        b=WqNZ3jtsRutd2lIlPfeQerrcd7kZ87GtPxraD7w4NOLHoncuQ7n596Czm+voutn4w9
         Pvx+kxsL9/i54Jby+13onlLYD/K6P2wp/ppETNJU1M44e1/2VUYZwMvlhubOVkhNDJ9Y
         fAznyMGNhVcuBHlcN9UsALIQNorgIw4kbvtYlY6fdjYinwedCZjLoblYxDwnPeLc23pw
         sihGBD036LCQbqI5UyDYDtd7I8HLk4V6M6+4sRRcQbtuStl9pkxwKeAEKKhjGV9jm3XY
         0+uI9QV+BNpfm6PthsaeVZPjUNODzqh/XGe2rPRhiE1bS6x3rZ/iKADSqzyFrrosD8Mr
         X05A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:from:date;
        bh=sP0V4c2+7AOT5I/9MRZedsfQc/xSjma6aeT/3tlB7i0=;
        b=FrLIRwCgjZbTFGxpgttMPv+1C+YmfWxWjVxo/jamhghRL473pXEt9w/SSnCR5IdTRJ
         IA6ua2xGrqkXHxHArBOcCSzKt0uieP5wRMpYZuDTK7dfv3wRkOnn0lbyO8XQGXgWHyb2
         8aDBxKkh9usesEaP2sZMojKqvzzKqWmHVyThCywlaajirfNo1pSglM8gAmNwa7naDgg4
         BRwVQrkms5XOK/UqF9c8dMGiDhjHnxKjAD/QMLCF11TK+nV6otP5b0SQa4xstcXMAh1H
         Mh6ArufbPXRPk9VzfJ/P7x1y8bygjdDEDL2rvGfxG1YZXhU/im0OEP3cQu/tcDMOuEuc
         +N8A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of tglx@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=tglx@linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id d27si312440ejt.1.2019.09.16.02.56.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 16 Sep 2019 02:56:00 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of tglx@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
Received: from pd9ef19d4.dip0.t-ipconnect.de ([217.239.25.212] helo=nanos)
	by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
	(Exim 4.80)
	(envelope-from <tglx@linutronix.de>)
	id 1i9nje-0000z2-D8; Mon, 16 Sep 2019 11:55:54 +0200
Date: Mon, 16 Sep 2019 11:55:53 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
cc: Jan Kiszka <jan.kiszka@siemens.com>, Borislav Petkov <bp@alien8.de>, 
    x86@kernel.org, jailhouse-dev@googlegroups.com, 
    Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v4 0/2] x86/jailhouse: improve probing of platform
 UARTs
In-Reply-To: <20190909151030.152012-1-ralf.ramsauer@oth-regensburg.de>
Message-ID: <alpine.DEB.2.21.1909161154030.10731@nanos.tec.linutronix.de>
References: <20190909151030.152012-1-ralf.ramsauer@oth-regensburg.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
X-Original-Sender: tglx@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: best guess record for domain of tglx@linutronix.de designates
 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=tglx@linutronix.de
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

On Mon, 9 Sep 2019, Ralf Ramsauer wrote:

> Hi,
> 
> probing of platform UARTs is a problem for x86 jailhouse non-root
> cells: Linux doesn't know which UARTs belong to the cell and will probe
> for all platform UARTs. This crashes the guest if access isn't
> permitted. Current workarounds (tuning via 8250.nr_uarts) are hacky and
> limited.
> 
> But we do have some flags inside setup_data that indicate availability
> of UARTs, so simply use it.
> 
>   Ralf
> 
> since v3: 
>   - Link: https://www.mail-archive.com/jailhouse-dev@googlegroups.com/msg07365.html

Could you please provide links which resolve via Message-ID of the cover letter?

      Link: https://lore.kernel.org/r/$MESSAGE_ID

These are way better as they allow retrieval via message ID even if the
archive URL vanished at some point.

Thanks,

	tglx

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/alpine.DEB.2.21.1909161154030.10731%40nanos.tec.linutronix.de.
