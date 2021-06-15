Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRB4P6UGDAMGQEADMCI7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73a.google.com (mail-qk1-x73a.google.com [IPv6:2607:f8b0:4864:20::73a])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6EF3A7BAE
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 12:22:42 +0200 (CEST)
Received: by mail-qk1-x73a.google.com with SMTP id a193-20020a3766ca0000b02903a9be00d619sf27851215qkc.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 03:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=G83csbqfj4BDeDNIQEuRdv9jyRx2UmLmWLygzDDGYFw=;
        b=TRTf/THX7D9rCNDnkxl0wiuNoCfmcrJ/GIAlwz7jyy4k/sST8JS3ufwMYQAR3XUQm/
         7PB49TfQ87B/RxFiI44xs2lzTIarhp7gUwrDxZa70fjXHK/mbleQC1VQQmp7lcMu+bxU
         L6ZchICW6m4Qvvsp4O58vAP6nxNrrQivSs7lfieQhhBtbKEs+NeqSJejRIxraLNYrT/f
         J2u9WL42PfJ5jp+Lot6nQvNaGm6rYnuhJwXIjcncw3YK6jDdT15jN/yfsJHdVG81V3Tf
         YtxL9D1i4IHWOjXTLsZ6+dIk5nCDH1Y1Xq1wFEAE1SwlutHPz/oR1b49NRk6JdHpCgZ2
         iBDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=G83csbqfj4BDeDNIQEuRdv9jyRx2UmLmWLygzDDGYFw=;
        b=JujFUyUIcjQUqwC76u1AvTgVdPULR0WUHBrfGkU7WwPSIlkiah0T5tTMJ1xLY6br7M
         GUUE4hHB9JLMFZRjbuwLLUpIP4M/7QIzz++FZIOGqQtMyb0CRgWAF6M8TCffAWuNwuuZ
         O6S68aEosTMulWZAvt4yLyH7O65pkVWDbuFI1UfWK8ghdOXi3LsHmiMA9LmBKnh+J8w0
         n9Zye52faef1zUkX5ql2kj6EjycFMDV+jbHhKUALKD37kAmcsHoMWNbr2iJ0ZynADMQK
         7T5NVsMdZpCl9xO9eukUeGNlg0DmLEQZJlRlKfoAs2o2ZS+afy0jLOl3WOyqj/z1driC
         0aXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=G83csbqfj4BDeDNIQEuRdv9jyRx2UmLmWLygzDDGYFw=;
        b=bDV30Ge7i0XkCsTKvaqnTsnCZNotdcm5KayPbRR9+gUZQ1rZCIK5G881bpUirJMREM
         DSJwEWv4aI1ag7eIAUQ7fCZUQbLr/qAsvZd2a0GW+ydSE3yVY59W9zdcLu5CvPTjnfuM
         SLkILBnvu6WTdZrtMadbNomk3Zf9i0bdsd2TZHPHthq1df+bE6DKhQLSK3Mo314kyhZc
         F3cqrzrKFHcB+Nz76j6Gn/A/34rKnGMRnFO7a9QHk6ZBITib/rY++DgmDhNSC5kJtP9F
         c21sgeOXSKKC+O0PQqp+JcKHcO1sQ4bzUIPb/133deo7prQiNU87KzWy6WfQUPNZ3rrh
         3VNA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532/lAUX4Q1lkiubv24EiuR3Xl0ypTWQNf6M89/oKA9b4bRiDtj2
	GkeGU9iTJK/X4qhoYQIz9xA=
X-Google-Smtp-Source: ABdhPJx2koUvJJOSrzUbuyd3SCuuifeUAw+mDeZM3xOCfugYOEWVM5Nm44PQMl6BYXQbWlptS2gy9w==
X-Received: by 2002:ae9:eb44:: with SMTP id b65mr20746717qkg.443.1623752561432;
        Tue, 15 Jun 2021 03:22:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5f4e:: with SMTP id y14ls9510333qta.5.gmail; Tue, 15 Jun
 2021 03:22:41 -0700 (PDT)
X-Received: by 2002:ac8:41d3:: with SMTP id o19mr21063996qtm.90.1623752560810;
        Tue, 15 Jun 2021 03:22:40 -0700 (PDT)
Date: Tue, 15 Jun 2021 03:22:40 -0700 (PDT)
From: along li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c4b6cccf-386d-4327-82e3-0d346e0f5965n@googlegroups.com>
In-Reply-To: <db85b6dc-4d10-3e91-cf4b-4ea6d8e44b2d@siemens.com>
References: <09c2642b-ba89-4226-8452-534393dc6a33n@googlegroups.com>
 <d5e6079c-5cf5-ce18-45c0-d0eaa7d60350@siemens.com>
 <aa1b60e5-a823-4cb5-b36f-d0162bf0583en@googlegroups.com>
 <db85b6dc-4d10-3e91-cf4b-4ea6d8e44b2d@siemens.com>
Subject: Re: How to partition PCI devices to none-root cells in rpi4b?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_918_1783423818.1623752560330"
X-Original-Sender: v6543210@gmail.com
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

------=_Part_918_1783423818.1623752560330
Content-Type: multipart/alternative; 
	boundary="----=_Part_919_404395456.1623752560330"

------=_Part_919_404395456.1623752560330
Content-Type: text/plain; charset="UTF-8"

I'm sorry the lspci -vvv and   /proc/iomem cann't be attatched 
sucessfully.  I paste it here.

lspci -vvv      output:
------------------------------------------------------------------------------------------------
00:00.0 PCI bridge: Broadcom Limited Device 2711 (rev 10) (prog-if 00 
[Normal decode])
Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B- DisINTx-
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
Latency: 0
Interrupt: pin A routed to IRQ 0
Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
I/O behind bridge: 00000000-00000fff
Memory behind bridge: f8000000-f80fffff
Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- 
<MAbort- <SERR- <PERR-
BridgeCtl: Parity- SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
Capabilities: [48] Power Management version 3
Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold-)
Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
Capabilities: [ac] Express (v2) Root Port (Slot-), MSI 00
DevCap: MaxPayload 512 bytes, PhantFunc 0
ExtTag- RBE+
DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
RlxdOrd+ ExtTag- PhantFunc- AuxPwr+ NoSnoop+
MaxPayload 128 bytes, MaxReadReq 512 bytes
DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
LnkCap: Port #0, Speed 5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <2us, 
L1 <4us
ClockPM+ Surprise- LLActRep- BwNot+ ASPMOptComp+
LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
LnkSta: Speed 5GT/s, Width x1, TrErr- Train- SlotClk+ DLActive- BWMgmt- 
ABWMgmt+
RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible+
RootCap: CRSVisible+
RootSta: PME ReqID 0000, PMEStatus- PMEPending-
DevCap2: Completion Timeout: Range ABCD, TimeoutDis+, LTR+, OBFF Via WAKE# 
ARIFwd-
DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled 
ARIFwd-
LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
Transmit Margin: Normal Operating Range, EnterModifiedCompliance- 
ComplianceSOS-
Compliance De-emphasis: -6dB
LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, 
EqualizationPhase1-
EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
Capabilities: [100 v1] Advanced Error Reporting
UESta: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- 
ECRC- UnsupReq- ACSViol-
UEMsk: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- 
ECRC- UnsupReq- ACSViol-
UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ 
ECRC- UnsupReq- ACSViol-
CESta: RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
CEMsk: RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
Capabilities: [180 v1] Vendor Specific Information: ID=0000 Rev=0 Len=028 
<?>
Capabilities: [240 v1] L1 PM Substates
L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
  PortCommonModeRestoreTime=8us PortTPowerOnTime=10us
L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
   T_CommonMode=1us LTR1.2_Threshold=0ns
L1SubCtl2: T_PwrOn=10us

01:00.0 USB controller: VIA Technologies, Inc. VL805 USB 3.0 Host 
Controller (rev 01) (prog-if 30 [XHCI])
Subsystem: VIA Technologies, Inc. VL805 USB 3.0 Host Controller
Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ 
Stepping- SERR+ FastB2B- DisINTx+
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
Latency: 0, Cache Line Size: 64 bytes
Interrupt: pin A routed to IRQ 42
Region 0: Memory at 600000000 (64-bit, non-prefetchable) [size=4K]
Capabilities: [80] Power Management version 3
Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1-,D2-,D3hot-,D3cold+)
Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
Capabilities: [90] MSI: Enable+ Count=1/4 Maskable- 64bit+
Address: 0000000ffffffffc  Data: 6540
Capabilities: [c4] Express (v2) Endpoint, MSI 00
DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <64ns, L1 <1us
ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0.000W
DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
MaxPayload 128 bytes, MaxReadReq 512 bytes
DevSta: CorrErr+ UncorrErr- FatalErr- UnsuppReq+ AuxPwr+ TransPend-
LnkCap: Port #0, Speed 5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <2us, 
L1 <16us
ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
LnkCtl: ASPM L0s L1 Enabled; RCB 64 bytes Disabled- CommClk+
ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
LnkSta: Speed 5GT/s, Width x1, TrErr- Train- SlotClk+ DLActive- BWMgmt- 
ABWMgmt-
DevCap2: Completion Timeout: Range B, TimeoutDis+, LTR-, OBFF Not Supported
DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis+
Transmit Margin: Normal Operating Range, EnterModifiedCompliance- 
ComplianceSOS-
Compliance De-emphasis: -6dB
LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete-, 
EqualizationPhase1-
EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
Capabilities: [100 v1] Advanced Error Reporting
UESta: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- 
ECRC- UnsupReq- ACSViol-
UEMsk: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- 
ECRC- UnsupReq- ACSViol-
UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ 
ECRC- UnsupReq- ACSViol-
CESta: RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
CEMsk: RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
Kernel driver in use: xhci_hcd
--------------------------------------------------------------------------------------



/proc/iomem
---------------------------------------------------------------------------------
00080000-1fffffff : System RAM
  00080000-00caffff : Kernel code
  00cb0000-00d9ffff : reserved
  00da0000-00fd9fff : Kernel data
  0c000000-1fffffff : reserved
50000000-fbffffff : System RAM
fd500000-fd50930f : fd500000.pcie
fd580000-fd58ffff : fd580000.ethernet
  fd580e14-fd580e1c : unimac-mdio.-19
fe007000-fe007aff : fe007000.dma
fe007b00-fe007eff : fe007b00.dma
fe00a000-fe00a023 : fe100000.watchdog
fe00b840-fe00b87b : fe00b840.mailbox
fe00b880-fe00b8bf : fe00b880.mailbox
fe100000-fe100113 : fe100000.watchdog
fe101000-fe102fff : fe101000.cprman
fe104000-fe10400f : fe104000.rng
fe200000-fe2000b3 : fe200000.gpio
fe201000-fe2011ff : serial@7e201000
  fe201000-fe2011ff : fe201000.serial
fe215000-fe215007 : fe215000.aux
fe215040-fe21507f : fe215040.serial
fe300000-fe3000ff : fe300000.mmcnr
fe340000-fe3400ff : fe340000.emmc2
fec00000-fec03fff : fec00000.v3d
fec04000-fec07fff : fec00000.v3d
fec11000-fec1101f : fe100000.watchdog
100000000-1ffffffff : System RAM
  1f6200000-1f6ffffff : reserved
  1f71ff000-1feffffff : reserved
  1ff07b000-1ff0dafff : reserved
  1ff0db000-1ff0dbfff : reserved
  1ff0dc000-1ff157fff : reserved
  1ff15a000-1ff15afff : reserved
  1ff15b000-1ff15bfff : reserved
  1ff15c000-1ff15efff : reserved
  1ff15f000-1ffffffff : reserved
600000000-603ffffff : pcie@7d500000
  600000000-6000fffff : PCI Bus 0000:01
    600000000-600000fff : 0000:01:00.0
      600000000-600000fff : xhci-hcd
---------------------------------------------------------------------------------

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c4b6cccf-386d-4327-82e3-0d346e0f5965n%40googlegroups.com.

------=_Part_919_404395456.1623752560330
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm sorry the lspci -vvv and&nbsp; &nbsp;/proc/iomem cann't be attatched su=
cessfully.&nbsp; I paste it here.<div><br></div><div>lspci -vvv&nbsp; &nbsp=
; &nbsp; output:</div><div>------------------------------------------------=
------------------------------------------------<br><div>00:00.0 PCI bridge=
: Broadcom Limited Device 2711 (rev 10) (prog-if 00 [Normal decode])</div><=
div><span style=3D"white-space:pre">	</span>Control: I/O- Mem+ BusMaster+ S=
pecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-</div=
><div><span style=3D"white-space:pre">	</span>Status: Cap+ 66MHz- UDF- Fast=
B2B- ParErr- DEVSEL=3Dfast &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &l=
t;PERR- INTx-</div><div><span style=3D"white-space:pre">	</span>Latency: 0<=
/div><div><span style=3D"white-space:pre">	</span>Interrupt: pin A routed t=
o IRQ 0</div><div><span style=3D"white-space:pre">	</span>Bus: primary=3D00=
, secondary=3D01, subordinate=3D01, sec-latency=3D0</div><div><span style=
=3D"white-space:pre">	</span>I/O behind bridge: 00000000-00000fff</div><div=
><span style=3D"white-space:pre">	</span>Memory behind bridge: f8000000-f80=
fffff</div><div><span style=3D"white-space:pre">	</span>Prefetchable memory=
 behind bridge: 00000000fff00000-00000000000fffff</div><div><span style=3D"=
white-space:pre">	</span>Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=
=3Dfast &gt;TAbort- &lt;TAbort- &lt;MAbort- &lt;SERR- &lt;PERR-</div><div><=
span style=3D"white-space:pre">	</span>BridgeCtl: Parity- SERR+ NoISA- VGA-=
 MAbort- &gt;Reset- FastB2B-</div><div><span style=3D"white-space:pre">		</=
span>PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-</div><div><span st=
yle=3D"white-space:pre">	</span>Capabilities: [48] Power Management version=
 3</div><div><span style=3D"white-space:pre">		</span>Flags: PMEClk- DSI- D=
1- D2- AuxCurrent=3D0mA PME(D0+,D1-,D2-,D3hot+,D3cold-)</div><div><span sty=
le=3D"white-space:pre">		</span>Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 =
DScale=3D1 PME-</div><div><span style=3D"white-space:pre">	</span>Capabilit=
ies: [ac] Express (v2) Root Port (Slot-), MSI 00</div><div><span style=3D"w=
hite-space:pre">		</span>DevCap:<span style=3D"white-space:pre">	</span>Max=
Payload 512 bytes, PhantFunc 0</div><div><span style=3D"white-space:pre">		=
	</span>ExtTag- RBE+</div><div><span style=3D"white-space:pre">		</span>Dev=
Ctl:<span style=3D"white-space:pre">	</span>Report errors: Correctable- Non=
-Fatal- Fatal- Unsupported-</div><div><span style=3D"white-space:pre">			</=
span>RlxdOrd+ ExtTag- PhantFunc- AuxPwr+ NoSnoop+</div><div><span style=3D"=
white-space:pre">			</span>MaxPayload 128 bytes, MaxReadReq 512 bytes</div>=
<div><span style=3D"white-space:pre">		</span>DevSta:<span style=3D"white-s=
pace:pre">	</span>CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPen=
d-</div><div><span style=3D"white-space:pre">		</span>LnkCap:<span style=3D=
"white-space:pre">	</span>Port #0, Speed 5GT/s, Width x1, ASPM L0s L1, Exit=
 Latency L0s &lt;2us, L1 &lt;4us</div><div><span style=3D"white-space:pre">=
			</span>ClockPM+ Surprise- LLActRep- BwNot+ ASPMOptComp+</div><div><span =
style=3D"white-space:pre">		</span>LnkCtl:<span style=3D"white-space:pre">	=
</span>ASPM Disabled; RCB 64 bytes Disabled- CommClk-</div><div><span style=
=3D"white-space:pre">			</span>ExtSynch- ClockPM- AutWidDis- BWInt- AutBWIn=
t-</div><div><span style=3D"white-space:pre">		</span>LnkSta:<span style=3D=
"white-space:pre">	</span>Speed 5GT/s, Width x1, TrErr- Train- SlotClk+ DLA=
ctive- BWMgmt- ABWMgmt+</div><div><span style=3D"white-space:pre">		</span>=
RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible+</di=
v><div><span style=3D"white-space:pre">		</span>RootCap: CRSVisible+</div><=
div><span style=3D"white-space:pre">		</span>RootSta: PME ReqID 0000, PMESt=
atus- PMEPending-</div><div><span style=3D"white-space:pre">		</span>DevCap=
2: Completion Timeout: Range ABCD, TimeoutDis+, LTR+, OBFF Via WAKE# ARIFwd=
-</div><div><span style=3D"white-space:pre">		</span>DevCtl2: Completion Ti=
meout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-</div><div><sp=
an style=3D"white-space:pre">		</span>LnkCtl2: Target Link Speed: 5GT/s, En=
terCompliance- SpeedDis-</div><div><span style=3D"white-space:pre">			</spa=
n> Transmit Margin: Normal Operating Range, EnterModifiedCompliance- Compli=
anceSOS-</div><div><span style=3D"white-space:pre">			</span> Compliance De=
-emphasis: -6dB</div><div><span style=3D"white-space:pre">		</span>LnkSta2:=
 Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1=
-</div><div><span style=3D"white-space:pre">			</span> EqualizationPhase2-,=
 EqualizationPhase3-, LinkEqualizationRequest-</div><div><span style=3D"whi=
te-space:pre">	</span>Capabilities: [100 v1] Advanced Error Reporting</div>=
<div><span style=3D"white-space:pre">		</span>UESta:<span style=3D"white-sp=
ace:pre">	</span>DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- M=
alfTLP- ECRC- UnsupReq- ACSViol-</div><div><span style=3D"white-space:pre">=
		</span>UEMsk:<span style=3D"white-space:pre">	</span>DLP- SDES- TLP- FCP-=
 CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-</div=
><div><span style=3D"white-space:pre">		</span>UESvrt:<span style=3D"white-=
space:pre">	</span>DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+=
 MalfTLP+ ECRC- UnsupReq- ACSViol-</div><div><span style=3D"white-space:pre=
">		</span>CESta:<span style=3D"white-space:pre">	</span>RxErr- BadTLP- Bad=
DLLP- Rollover- Timeout- NonFatalErr-</div><div><span style=3D"white-space:=
pre">		</span>CEMsk:<span style=3D"white-space:pre">	</span>RxErr- BadTLP- =
BadDLLP- Rollover- Timeout- NonFatalErr+</div><div><span style=3D"white-spa=
ce:pre">		</span>AERCap:<span style=3D"white-space:pre">	</span>First Error=
 Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-</div><div><span style=3D"white=
-space:pre">	</span>Capabilities: [180 v1] Vendor Specific Information: ID=
=3D0000 Rev=3D0 Len=3D028 &lt;?&gt;</div><div><span style=3D"white-space:pr=
e">	</span>Capabilities: [240 v1] L1 PM Substates</div><div><span style=3D"=
white-space:pre">		</span>L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ AS=
PM_L1.1+ L1_PM_Substates+</div><div><span style=3D"white-space:pre">			</sp=
an>&nbsp; PortCommonModeRestoreTime=3D8us PortTPowerOnTime=3D10us</div><div=
><span style=3D"white-space:pre">		</span>L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1=
.1- ASPM_L1.2- ASPM_L1.1-</div><div><span style=3D"white-space:pre">			</sp=
an>&nbsp; &nbsp;T_CommonMode=3D1us LTR1.2_Threshold=3D0ns</div><div><span s=
tyle=3D"white-space:pre">		</span>L1SubCtl2: T_PwrOn=3D10us</div><div><br><=
/div><div>01:00.0 USB controller: VIA Technologies, Inc. VL805 USB 3.0 Host=
 Controller (rev 01) (prog-if 30 [XHCI])</div><div><span style=3D"white-spa=
ce:pre">	</span>Subsystem: VIA Technologies, Inc. VL805 USB 3.0 Host Contro=
ller</div><div><span style=3D"white-space:pre">	</span>Control: I/O- Mem+ B=
usMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- Di=
sINTx+</div><div><span style=3D"white-space:pre">	</span>Status: Cap+ 66MHz=
- UDF- FastB2B- ParErr- DEVSEL=3Dfast &gt;TAbort- &lt;TAbort- &lt;MAbort- &=
gt;SERR- &lt;PERR- INTx-</div><div><span style=3D"white-space:pre">	</span>=
Latency: 0, Cache Line Size: 64 bytes</div><div><span style=3D"white-space:=
pre">	</span>Interrupt: pin A routed to IRQ 42</div><div><span style=3D"whi=
te-space:pre">	</span>Region 0: Memory at 600000000 (64-bit, non-prefetchab=
le) [size=3D4K]</div><div><span style=3D"white-space:pre">	</span>Capabilit=
ies: [80] Power Management version 3</div><div><span style=3D"white-space:p=
re">		</span>Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D375mA PME(D0+,D1-,D2-=
,D3hot-,D3cold+)</div><div><span style=3D"white-space:pre">		</span>Status:=
 D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-</div><div><span style=
=3D"white-space:pre">	</span>Capabilities: [90] MSI: Enable+ Count=3D1/4 Ma=
skable- 64bit+</div><div><span style=3D"white-space:pre">		</span>Address: =
0000000ffffffffc&nbsp; Data: 6540</div><div><span style=3D"white-space:pre"=
>	</span>Capabilities: [c4] Express (v2) Endpoint, MSI 00</div><div><span s=
tyle=3D"white-space:pre">		</span>DevCap:<span style=3D"white-space:pre">	<=
/span>MaxPayload 256 bytes, PhantFunc 0, Latency L0s &lt;64ns, L1 &lt;1us</=
div><div><span style=3D"white-space:pre">			</span>ExtTag- AttnBtn- AttnInd=
- PwrInd- RBE+ FLReset- SlotPowerLimit 0.000W</div><div><span style=3D"whit=
e-space:pre">		</span>DevCtl:<span style=3D"white-space:pre">	</span>Report=
 errors: Correctable- Non-Fatal- Fatal- Unsupported-</div><div><span style=
=3D"white-space:pre">			</span>RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+=
</div><div><span style=3D"white-space:pre">			</span>MaxPayload 128 bytes, =
MaxReadReq 512 bytes</div><div><span style=3D"white-space:pre">		</span>Dev=
Sta:<span style=3D"white-space:pre">	</span>CorrErr+ UncorrErr- FatalErr- U=
nsuppReq+ AuxPwr+ TransPend-</div><div><span style=3D"white-space:pre">		</=
span>LnkCap:<span style=3D"white-space:pre">	</span>Port #0, Speed 5GT/s, W=
idth x1, ASPM L0s L1, Exit Latency L0s &lt;2us, L1 &lt;16us</div><div><span=
 style=3D"white-space:pre">			</span>ClockPM+ Surprise- LLActRep- BwNot- AS=
PMOptComp-</div><div><span style=3D"white-space:pre">		</span>LnkCtl:<span =
style=3D"white-space:pre">	</span>ASPM L0s L1 Enabled; RCB 64 bytes Disable=
d- CommClk+</div><div><span style=3D"white-space:pre">			</span>ExtSynch- C=
lockPM- AutWidDis- BWInt- AutBWInt-</div><div><span style=3D"white-space:pr=
e">		</span>LnkSta:<span style=3D"white-space:pre">	</span>Speed 5GT/s, Wid=
th x1, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-</div><div><span st=
yle=3D"white-space:pre">		</span>DevCap2: Completion Timeout: Range B, Time=
outDis+, LTR-, OBFF Not Supported</div><div><span style=3D"white-space:pre"=
>		</span>DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBF=
F Disabled</div><div><span style=3D"white-space:pre">		</span>LnkCtl2: Targ=
et Link Speed: 5GT/s, EnterCompliance- SpeedDis+</div><div><span style=3D"w=
hite-space:pre">			</span> Transmit Margin: Normal Operating Range, EnterMo=
difiedCompliance- ComplianceSOS-</div><div><span style=3D"white-space:pre">=
			</span> Compliance De-emphasis: -6dB</div><div><span style=3D"white-spac=
e:pre">		</span>LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationCom=
plete-, EqualizationPhase1-</div><div><span style=3D"white-space:pre">			</=
span> EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-</d=
iv><div><span style=3D"white-space:pre">	</span>Capabilities: [100 v1] Adva=
nced Error Reporting</div><div><span style=3D"white-space:pre">		</span>UES=
ta:<span style=3D"white-space:pre">	</span>DLP- SDES- TLP- FCP- CmpltTO- Cm=
pltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-</div><div><span =
style=3D"white-space:pre">		</span>UEMsk:<span style=3D"white-space:pre">	<=
/span>DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECR=
C- UnsupReq- ACSViol-</div><div><span style=3D"white-space:pre">		</span>UE=
Svrt:<span style=3D"white-space:pre">	</span>DLP+ SDES+ TLP- FCP+ CmpltTO- =
CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-</div><div><spa=
n style=3D"white-space:pre">		</span>CESta:<span style=3D"white-space:pre">=
	</span>RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-</div><div><=
span style=3D"white-space:pre">		</span>CEMsk:<span style=3D"white-space:pr=
e">	</span>RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+</div><di=
v><span style=3D"white-space:pre">		</span>AERCap:<span style=3D"white-spac=
e:pre">	</span>First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-</div=
><div><span style=3D"white-space:pre">	</span>Kernel driver in use: xhci_hc=
d</div><div>---------------------------------------------------------------=
-----------------------<br></div></div><div><br></div><div><br></div><div><=
br></div><div>/proc/iomem</div><div>---------------------------------------=
------------------------------------------<br></div><div><div>00080000-1fff=
ffff : System RAM</div><div>&nbsp; 00080000-00caffff : Kernel code</div><di=
v>&nbsp; 00cb0000-00d9ffff : reserved</div><div>&nbsp; 00da0000-00fd9fff : =
Kernel data</div><div>&nbsp; 0c000000-1fffffff : reserved</div><div>5000000=
0-fbffffff : System RAM</div><div>fd500000-fd50930f : fd500000.pcie</div><d=
iv>fd580000-fd58ffff : fd580000.ethernet</div><div>&nbsp; fd580e14-fd580e1c=
 : unimac-mdio.-19</div><div>fe007000-fe007aff : fe007000.dma</div><div>fe0=
07b00-fe007eff : fe007b00.dma</div><div>fe00a000-fe00a023 : fe100000.watchd=
og</div><div>fe00b840-fe00b87b : fe00b840.mailbox</div><div>fe00b880-fe00b8=
bf : fe00b880.mailbox</div><div>fe100000-fe100113 : fe100000.watchdog</div>=
<div>fe101000-fe102fff : fe101000.cprman</div><div>fe104000-fe10400f : fe10=
4000.rng</div><div>fe200000-fe2000b3 : fe200000.gpio</div><div>fe201000-fe2=
011ff : serial@7e201000</div><div>&nbsp; fe201000-fe2011ff : fe201000.seria=
l</div><div>fe215000-fe215007 : fe215000.aux</div><div>fe215040-fe21507f : =
fe215040.serial</div><div>fe300000-fe3000ff : fe300000.mmcnr</div><div>fe34=
0000-fe3400ff : fe340000.emmc2</div><div>fec00000-fec03fff : fec00000.v3d</=
div><div>fec04000-fec07fff : fec00000.v3d</div><div>fec11000-fec1101f : fe1=
00000.watchdog</div><div>100000000-1ffffffff : System RAM</div><div>&nbsp; =
1f6200000-1f6ffffff : reserved</div><div>&nbsp; 1f71ff000-1feffffff : reser=
ved</div><div>&nbsp; 1ff07b000-1ff0dafff : reserved</div><div>&nbsp; 1ff0db=
000-1ff0dbfff : reserved</div><div>&nbsp; 1ff0dc000-1ff157fff : reserved</d=
iv><div>&nbsp; 1ff15a000-1ff15afff : reserved</div><div>&nbsp; 1ff15b000-1f=
f15bfff : reserved</div><div>&nbsp; 1ff15c000-1ff15efff : reserved</div><di=
v>&nbsp; 1ff15f000-1ffffffff : reserved</div><div>600000000-603ffffff : pci=
e@7d500000</div><div>&nbsp; 600000000-6000fffff : PCI Bus 0000:01</div><div=
>&nbsp; &nbsp; 600000000-600000fff : 0000:01:00.0</div><div>&nbsp; &nbsp; &=
nbsp; 600000000-600000fff : xhci-hcd</div></div><div>----------------------=
-----------------------------------------------------------</div><div><br><=
/div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c4b6cccf-386d-4327-82e3-0d346e0f5965n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c4b6cccf-386d-4327-82e3-0d346e0f5965n%40googlegroups.co=
m</a>.<br />

------=_Part_919_404395456.1623752560330--

------=_Part_918_1783423818.1623752560330--
